using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Pages
{
    public partial class ManageTutorials : Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadTutorials();
        }

        private void LoadTutorials()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Tutorials ORDER BY TutorialID DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (!dt.Columns.Contains("IsEditing"))
                    dt.Columns.Add("IsEditing", typeof(bool));
                foreach (DataRow row in dt.Rows)
                    row["IsEditing"] = false;

                rptTutorials.DataSource = dt;
                rptTutorials.DataBind();
            }
        }

        protected void btnAddTutorial_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"INSERT INTO Tutorials 
                    (Title, Description, ContentText, VideoURL, ImageURL, CategoryID, CreatedBy, CreatedDate) 
                    VALUES (@Title,@Desc,@Content,@Video,@Image,@Cat,1,GETDATE())";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@Desc", txtDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@Content", txtContent.Text.Trim());
                cmd.Parameters.AddWithValue("@Video", txtVideo.Text.Trim());
                cmd.Parameters.AddWithValue("@Image", txtImage.Text.Trim());
                cmd.Parameters.AddWithValue("@Cat", txtCategory.Text.Trim());
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            txtTitle.Text = txtDesc.Text = txtContent.Text = txtVideo.Text = txtImage.Text = txtCategory.Text = "";
            LoadTutorials();
        }

        protected void rptTutorials_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int tutorialID = Convert.ToInt32(e.CommandArgument);
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Tutorials ORDER BY TutorialID DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.Fill(dt);
            }

            if (!dt.Columns.Contains("IsEditing"))
                dt.Columns.Add("IsEditing", typeof(bool));
            foreach (DataRow row in dt.Rows)
                row["IsEditing"] = false;

            if (e.CommandName == "Edit")
            {
                DataRow row = dt.Select("TutorialID=" + tutorialID)[0];
                row["IsEditing"] = true;
            }
            else if (e.CommandName == "Delete")
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    SqlCommand cmdDel = new SqlCommand("DELETE FROM Tutorials WHERE TutorialID=@ID", conn);
                    cmdDel.Parameters.AddWithValue("@ID", tutorialID);
                    cmdDel.ExecuteNonQuery();
                }
            }
            else if (e.CommandName == "Update")
            {
                TextBox txtTitleEdit = (TextBox)e.Item.FindControl("txtEditTitle");
                TextBox txtDescEdit = (TextBox)e.Item.FindControl("txtEditDesc");
                TextBox txtContentEdit = (TextBox)e.Item.FindControl("txtEditContent");
                TextBox txtVideoEdit = (TextBox)e.Item.FindControl("txtEditVideo");
                TextBox txtImageEdit = (TextBox)e.Item.FindControl("txtEditImage");
                TextBox txtCatEdit = (TextBox)e.Item.FindControl("txtEditCategory");

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    SqlCommand cmdUpd = new SqlCommand(@"UPDATE Tutorials SET 
                        Title=@Title, Description=@Desc, ContentText=@Content, VideoURL=@Video, ImageURL=@Image, CategoryID=@Cat 
                        WHERE TutorialID=@ID", conn);
                    cmdUpd.Parameters.AddWithValue("@Title", txtTitleEdit.Text.Trim());
                    cmdUpd.Parameters.AddWithValue("@Desc", txtDescEdit.Text.Trim());
                    cmdUpd.Parameters.AddWithValue("@Content", txtContentEdit.Text.Trim());
                    cmdUpd.Parameters.AddWithValue("@Video", txtVideoEdit.Text.Trim());
                    cmdUpd.Parameters.AddWithValue("@Image", txtImageEdit.Text.Trim());
                    cmdUpd.Parameters.AddWithValue("@Cat", txtCatEdit.Text.Trim());
                    cmdUpd.Parameters.AddWithValue("@ID", tutorialID);
                    cmdUpd.ExecuteNonQuery();
                }
            }

            rptTutorials.DataSource = dt;
            rptTutorials.DataBind();
        }
    }
}