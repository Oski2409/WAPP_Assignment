using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Pages
{
    public partial class ManageQuizzes : System.Web.UI.Page
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
                string query = @"SELECT q.QuizID, q.TutorialID, q.Title, q.Description, 
                                 t.Title AS TutorialTitle, q.CreatedBy, q.CreatedDate
                                 FROM Quizzes q
                                 INNER JOIN Tutorials t ON q.TutorialID = t.TutorialID";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvQuizzes.DataSource = dt;
                gvQuizzes.DataBind();
            }
        }

        protected void gvQuizzes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvQuizzes.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvQuizzes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvQuizzes.EditIndex = -1;
            BindGrid();
        }

        protected void gvQuizzes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int quizId = Convert.ToInt32(gvQuizzes.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvQuizzes.Rows[e.RowIndex];

            string title = ((TextBox)row.Cells[1].Controls[0]).Text;
            string description = ((TextBox)row.Cells[2].Controls[0]).Text;
            int tutorialId = Convert.ToInt32(((DropDownList)row.FindControl("ddlTutorial")).SelectedValue);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Quizzes SET Title=@Title, Description=@Desc, TutorialID=@Tid WHERE QuizID=@ID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Desc", description);
                cmd.Parameters.AddWithValue("@Tid", tutorialId);
                cmd.Parameters.AddWithValue("@ID", quizId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            gvQuizzes.EditIndex = -1;
            BindGrid();
        }

        protected void gvQuizzes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int quizId = Convert.ToInt32(gvQuizzes.DataKeys[e.RowIndex].Value);
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Quizzes WHERE QuizID=@ID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ID", quizId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            BindGrid();
        }

        protected void gvQuizzes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gvQuizzes.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlTutorial = (DropDownList)e.Row.FindControl("ddlTutorial");
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("SELECT TutorialID, Title FROM Tutorials", conn);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlTutorial.DataSource = reader;
                    ddlTutorial.DataTextField = "Title";
                    ddlTutorial.DataValueField = "TutorialID";
                    ddlTutorial.DataBind();

                    ddlTutorial.SelectedValue = DataBinder.Eval(e.Row.DataItem, "TutorialID").ToString();
                }
            }
        }
    }
}