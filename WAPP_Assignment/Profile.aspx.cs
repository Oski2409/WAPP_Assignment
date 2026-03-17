using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Pages
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadUserData();
                LoadBadges();
            }
        }

        private void LoadUserData()
        {
            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string query = "SELECT FullName, Email FROM Users WHERE UserID=@UserID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtFullName.Text = reader["FullName"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtPassword.Text))
            {
                if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    lblMessage.Text = "Passwords do not match.";
                    return;
                }

                // Password validation: minimum 8 characters, letters and numbers
                if (!Regex.IsMatch(txtPassword.Text, @"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"))
                {
                    lblMessage.Text = "Password must be at least 8 characters and contain both letters and numbers.";
                    return;
                }
            }

            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string query;

                if (!string.IsNullOrEmpty(txtPassword.Text))
                {
                    query = @"UPDATE Users 
                              SET FullName=@FullName,
                                  Email=@Email,
                                  PasswordHash=@Password
                              WHERE UserID=@UserID";
                }
                else
                {
                    query = @"UPDATE Users 
                              SET FullName=@FullName,
                                  Email=@Email
                              WHERE UserID=@UserID";
                }

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                if (!string.IsNullOrEmpty(txtPassword.Text))
                {
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                }

                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = "Profile updated successfully!";
        }
        private void LoadBadges()
        {
            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string query = @"SELECT B.BadgeName
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
    }
}