using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace WAPP_Assignment.Pages
{
    public partial class Profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
                Response.Redirect("Login.aspx");

            if (!IsPostBack)
                LoadUserData();

            if (Session["OTP"] != null)
            {
                otpSection.Visible = true;
                newPasswordSection.Visible = true;
            }
        }

        private void LoadUserData()
        {
            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT FullName, Email, PasswordHash FROM Users WHERE UserID=@UserID", conn);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtFullName.Text = reader["FullName"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                }
            }
        }

        // ── Send OTP ────────────────────────────────────────────────────────────
        protected void btnSendOtp_Click(object sender, EventArgs e)
        {
            // 1. Verify current password first
            if (string.IsNullOrWhiteSpace(txtCurrentPassword.Text))
            {
                ShowError("Please enter your current password before requesting an OTP.");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;
            string dbPassword = "";
            string userEmail = "";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT PasswordHash, Email FROM Users WHERE UserID=@UserID", conn);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    dbPassword = reader["PasswordHash"].ToString();
                    userEmail = reader["Email"].ToString();
                }
            }

            if (txtCurrentPassword.Text != dbPassword)
            {
                ShowError("Current password is incorrect.");
                return;
            }

            // 2. Generate a 6-digit OTP and store it in Session with expiry
            Random rng = new Random();
            string otp = new Random().Next(100000, 999999).ToString();
            Session["OTP"] = otp;
            Session["OTPExpiry"] = DateTime.Now.AddMinutes(5);

            // 3. Send OTP email
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("smartclickswapp@gmail.com");
                mail.To.Add(userEmail);
                mail.Subject = "SmartClicks – Your Password Change OTP";
                mail.Body = $@"
                    <p>Hi,</p>
                    <p>Your OTP for changing your SmartClicks password is:</p>
                    <h2 style='letter-spacing:4px'>{otp}</h2>
                    <p>This code expires in <strong>5 minutes</strong>.</p>
                    <p>If you did not request this, please ignore this email.</p>
                ";
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Send(mail);

                // 4. Show OTP + new password fields
                otpSection.Visible = true;
                newPasswordSection.Visible = true;
                ShowSuccess("OTP sent to " + userEmail + ". Check your inbox.");
            }
            catch (Exception ex)
            {
                ShowError("Failed to send OTP. Error: " + ex.Message);
            }
        }

        // ── Update Profile ───────────────────────────────────────────────────────
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            bool changingPassword = !string.IsNullOrWhiteSpace(txtPassword.Text);

            if (changingPassword)
            {
                // Validate OTP
                if (Session["OTP"] == null || Session["OTPExpiry"] == null)
                {
                    ShowError("Please request an OTP first.");
                    return;
                }
                if (DateTime.Now > (DateTime)Session["OTPExpiry"])
                {
                    ShowError("OTP has expired. Please request a new one.");
                    Session.Remove("OTP");
                    Session.Remove("OTPExpiry");
                    return;
                }
                if (txtOtp.Text.Trim() != Session["OTP"].ToString())
                {
                    ShowError("Invalid OTP. Please try again.");
                    return;
                }

                // Validate new password
                if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    ShowError("New passwords do not match.");
                    return;
                }
                if (!Regex.IsMatch(txtPassword.Text,
                    @"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"))
                {
                    ShowError("Password must be at least 8 characters and contain letters and numbers.");
                    return;
                }
            }

            // Update database
            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = changingPassword
                    ? "UPDATE Users SET FullName=@FullName, Email=@Email, PasswordHash=@Password WHERE UserID=@UserID"
                    : "UPDATE Users SET FullName=@FullName, Email=@Email WHERE UserID=@UserID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                if (changingPassword)
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                cmd.ExecuteNonQuery();
            }

            // Clear OTP from session
            Session.Remove("OTP");
            Session.Remove("OTPExpiry");

            // Hide OTP/password sections again
            otpSection.Visible = false;
            newPasswordSection.Visible = false;

            ShowSuccess("Profile updated successfully!");
        }

        private void ShowError(string msg)
        {
            lblMessage.Text = msg;
            lblMessage.CssClass = "text-danger text-center d-block mb-3";
        }

        private void ShowSuccess(string msg)
        {
            lblMessage.Text = msg;
            lblMessage.CssClass = "text-success text-center d-block mb-3";
        }
    }
}