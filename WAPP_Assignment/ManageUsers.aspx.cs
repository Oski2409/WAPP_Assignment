using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Pages
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadUsers();
        }

        private void LoadUsers()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Users", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"INSERT INTO Users (FullName, Email, PasswordHash, Role, AccountStatus, RegistrationDate)
                                VALUES (@FullName, @Email, @Password, @Role, @Status, GETDATE())";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FullName", txtNewFullName.Text);
                cmd.Parameters.AddWithValue("@Email", txtNewEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtNewPassword.Text);
                cmd.Parameters.AddWithValue("@Role", ddlNewRole.SelectedValue);
                cmd.Parameters.AddWithValue("@Status", ddlNewStatus.SelectedValue);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Clear fields
            txtNewFullName.Text = txtNewEmail.Text = "";
            txtNewPassword.Text = "";
            ddlNewRole.SelectedIndex = ddlNewStatus.SelectedIndex = 0;

            LoadUsers();
        }

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            LoadUsers();
        }

        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            LoadUsers();
        }

        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int userID = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvUsers.Rows[e.RowIndex];

            string fullName = (row.Cells[1].Controls[0] as TextBox)?.Text ?? "";
            string email = (row.Cells[2].Controls[0] as TextBox)?.Text ?? "";
            string role = (row.Cells[3].Controls[0] as TextBox)?.Text ?? "";
            string status = (row.Cells[4].Controls[0] as TextBox)?.Text ?? "";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"UPDATE Users 
                                 SET FullName=@FullName, Email=@Email, Role=@Role, AccountStatus=@Status
                                 WHERE UserID=@UserID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Role", role);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@UserID", userID);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            gvUsers.EditIndex = -1;
            LoadUsers();
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userID = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Users WHERE UserID=@UserID", conn);
                cmd.Parameters.AddWithValue("@UserID", userID);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            LoadUsers();
        }
    }
}