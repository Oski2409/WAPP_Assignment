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
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string password = txtPassword.Text;

            // Password rule: min 8 chars, letters + numbers
            if (!Regex.IsMatch(password, @"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"))
            {
                lblMessage.Text = "Password must be at least 8 characters and contain both letters and numbers.";
                return;
            }

            // Check if passwords match
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Check if email already exists
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email=@Email";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@Email", txtEmail.Text);

                int userExists = (int)checkCmd.ExecuteScalar();

                if (userExists > 0)
                {
                    lblMessage.Text = "Email already registered.";
                    return;
                }

                // Insert new user
                string insertQuery = @"INSERT INTO Users 
                               (FullName, Email, PasswordHash, Role, RegistrationDate, AccountStatus)
                               VALUES
                               (@FullName, @Email, @Password, 'RegisteredUser', GETDATE(), 'Active')";

                SqlCommand cmd = new SqlCommand(insertQuery, conn);
                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Login.aspx");
        }
    }
}