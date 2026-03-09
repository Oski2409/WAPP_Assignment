using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace WAPP_Assignment.Pages
{
    public partial class ManageTutorials : System.Web.UI.Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindGrid();
        }

        private void BindGrid()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT t.TutorialID, t.Title, t.Description, t.ContentText, t.VideoURL, t.ImageURL, 
                                 t.CategoryID, c.CategoryName, t.CreatedBy, t.CreatedDate
                                 FROM Tutorials t
                                 INNER JOIN Categories c ON t.CategoryID = c.CategoryID";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvTutorials.DataSource = dt;
                gvTutorials.DataBind();
            }
        }

        protected void gvTutorials_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTutorials.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvTutorials_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTutorials.EditIndex = -1;
            BindGrid();
        }

        protected void gvTutorials_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int tutorialId = Convert.ToInt32(gvTutorials.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvTutorials.Rows[e.RowIndex];

            string title = ((TextBox)row.Cells[1].Controls[0]).Text;
            string description = ((TextBox)row.Cells[2].Controls[0]).Text;
            string content = ((TextBox)row.Cells[3].Controls[0]).Text;
            string video = ((TextBox)row.Cells[4].Controls[0]).Text;
            string image = ((TextBox)row.Cells[5].Controls[0]).Text;
            int categoryId = Convert.ToInt32(((DropDownList)row.FindControl("ddlCategory")).SelectedValue);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"UPDATE Tutorials SET Title=@Title, Description=@Desc, ContentText=@Content, 
                                 VideoURL=@Video, ImageURL=@Image, CategoryID=@CatID 
                                 WHERE TutorialID=@ID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Desc", description);
                cmd.Parameters.AddWithValue("@Content", content);
                cmd.Parameters.AddWithValue("@Video", video);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.Parameters.AddWithValue("@CatID", categoryId);
                cmd.Parameters.AddWithValue("@ID", tutorialId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            gvTutorials.EditIndex = -1;
            BindGrid();
        }

        protected void gvTutorials_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int tutorialId = Convert.ToInt32(gvTutorials.DataKeys[e.RowIndex].Value);
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Tutorials WHERE TutorialID=@ID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ID", tutorialId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            BindGrid();
        }

        protected void gvTutorials_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gvTutorials.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlCategory = (DropDownList)e.Row.FindControl("ddlCategory");
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("SELECT CategoryID, CategoryName FROM Categories", conn);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlCategory.DataSource = reader;
                    ddlCategory.DataTextField = "CategoryName";
                    ddlCategory.DataValueField = "CategoryID";
                    ddlCategory.DataBind();

                    // Set current value
                    ddlCategory.SelectedValue = DataBinder.Eval(e.Row.DataItem, "CategoryID").ToString();
                }
            }
        }
    }
}
