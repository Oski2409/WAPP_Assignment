using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Pages
{
    public partial class ManageTutorials : System.Web.UI.Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;
        private DataTable dtTutorials;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadTutorials();
        }

        private void LoadTutorials()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT t.TutorialID, t.Title, t.Description, t.ContentText, t.VideoURL, t.ImageURL,
                                 t.CategoryID, c.CategoryName, t.CreatedBy, t.CreatedDate
                                 FROM Tutorials t
                                 INNER JOIN Categories c ON t.CategoryID = c.CategoryID";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                dtTutorials = new DataTable();
                da.Fill(dtTutorials);

                // Ensure IsEditing column exists and initialized to false
                if (!dtTutorials.Columns.Contains("IsEditing"))
                    dtTutorials.Columns.Add("IsEditing", typeof(bool));

                foreach (DataRow row in dtTutorials.Rows)
                    row["IsEditing"] = false;

                rptTutorials.DataSource = dtTutorials;
                rptTutorials.DataBind();
            }
        }

        protected void rptTutorials_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int tutorialId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Edit")
                ToggleEdit(tutorialId, true);
            else if (e.CommandName == "Cancel")
                ToggleEdit(tutorialId, false);
            else if (e.CommandName == "Update")
            {
                TextBox txtTitle = (TextBox)e.Item.FindControl("txtTitle");
                TextBox txtDesc = (TextBox)e.Item.FindControl("txtDescription");
                TextBox txtContent = (TextBox)e.Item.FindControl("txtContent");
                TextBox txtVideo = (TextBox)e.Item.FindControl("txtVideo");
                TextBox txtImage = (TextBox)e.Item.FindControl("txtImage");
                DropDownList ddlCat = (DropDownList)e.Item.FindControl("ddlCategory");

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"UPDATE Tutorials SET Title=@Title, Description=@Desc, ContentText=@Content,
                                     VideoURL=@Video, ImageURL=@Image, CategoryID=@CatID WHERE TutorialID=@ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@Desc", txtDesc.Text);
                    cmd.Parameters.AddWithValue("@Content", txtContent.Text);
                    cmd.Parameters.AddWithValue("@Video", txtVideo.Text);
                    cmd.Parameters.AddWithValue("@Image", txtImage.Text);
                    cmd.Parameters.AddWithValue("@CatID", ddlCat.SelectedValue);
                    cmd.Parameters.AddWithValue("@ID", tutorialId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                ToggleEdit(tutorialId, false);
            }
            else if (e.CommandName == "Delete")
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "DELETE FROM Tutorials WHERE TutorialID=@ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ID", tutorialId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                LoadTutorials();
            }
        }

        private void ToggleEdit(int tutorialId, bool isEditing)
        {
            LoadTutorials();
            foreach (DataRow row in dtTutorials.Rows)
                if ((int)row["TutorialID"] == tutorialId)
                    row["IsEditing"] = isEditing;

            rptTutorials.DataSource = dtTutorials;
            rptTutorials.DataBind();
        }

        protected void rptTutorials_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddlCat = (DropDownList)e.Item.FindControl("ddlCategory");
                if (ddlCat != null)
                {
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        SqlCommand cmd = new SqlCommand("SELECT CategoryID, CategoryName FROM Categories", conn);
                        conn.Open();
                        ddlCat.DataSource = cmd.ExecuteReader();
                        ddlCat.DataTextField = "CategoryName";
                        ddlCat.DataValueField = "CategoryID";
                        ddlCat.DataBind();
                        ddlCat.SelectedValue = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "CategoryID"));
                    }
                }
            }
        }
    }
}