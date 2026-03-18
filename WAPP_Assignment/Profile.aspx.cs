using System;
using System.Configuration;
using System.Data.SqlClient;
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
            {
                LoadUserData();
                LoadBadges();   // teammate feature
            }

            // keep OTP section visible after postback
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
                    "SELECT FullName, Email FROM Users WHERE UserID=@UserID", conn);

                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtFullName.Text = reader["FullName"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                }
            }
        }

        // SEND OTP
        protected void btnSendOtp_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCurrentPassword.Text))
            {
                ShowError("Please enter your current password first.");
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

            // Generate OTP
            string otp = new Random().Next(100000, 999999).ToString();

            Session["OTP"] = otp;
            Session["OTPExpiry"] = DateTime.Now.AddMinutes(5);

            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("smartclickswapp@gmail.com");
                mail.To.Add(userEmail);

                mail.Subject = "SmartClicks – Your Password Change OTP";

                mail.Body = $@"
                <p>Hi,</p>
                <p>Your OTP for changing your SmartClicks password is:</p>
                <h2>{otp}</h2>
                <p>This code expires in 5 minutes.</p>";

                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();

                smtp.Send(mail);

                otpSection.Visible = true;
                newPasswordSection.Visible = true;

                ShowSuccess("OTP sent to your email.");
            }
            catch (Exception ex)
            {
                ShowError("Failed to send OTP: " + ex.Message);
            }
        }

        // UPDATE PROFILE
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            bool changingPassword = !string.IsNullOrWhiteSpace(txtPassword.Text);

            if (changingPassword)
            {
                if (Session["OTP"] == null || Session["OTPExpiry"] == null)
                {
                    ShowError("Please request OTP first.");
                    return;
                }

                if (DateTime.Now > (DateTime)Session["OTPExpiry"])
                {
                    ShowError("OTP expired.");
                    return;
                }

                if (txtOtp.Text.Trim() != Session["OTP"].ToString())
                {
                    ShowError("Invalid OTP.");
                    return;
                }

                if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    ShowError("Passwords do not match.");
                    return;
                }

                if (!Regex.IsMatch(txtPassword.Text,
                    @"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"))
                {
                    ShowError("Password must contain letters and numbers and be at least 8 characters.");
                    return;
                }
            }

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

            Session.Remove("OTP");
            Session.Remove("OTPExpiry");

            otpSection.Visible = false;
            newPasswordSection.Visible = false;

            ShowSuccess("Profile updated successfully!");
        }

        private void LoadBadges()
        {
            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string query = @"SELECT B.BadgeName, B.Description
                 FROM UserBadges UB
                 JOIN Badges B ON UB.BadgeID = B.BadgeID
                 WHERE UB.UserID = @UserID";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                System.Data.DataTable dt = new System.Data.DataTable();

                da.Fill(dt);

                rptBadges.DataSource = dt;

                rptBadges.DataBind();
            }
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