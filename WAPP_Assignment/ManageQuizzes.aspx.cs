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
        private DataTable dtQuizzes;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadQuizzes();
        }

        private void LoadQuizzes()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT q.QuizID, q.Title, q.Description, q.TutorialID,
                                 t.Title AS TutorialTitle, q.CreatedBy, q.CreatedDate
                                 FROM Quizzes q
                                 INNER JOIN Tutorials t ON q.TutorialID = t.TutorialID";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                dtQuizzes = new DataTable();
                da.Fill(dtQuizzes);

                if (!dtQuizzes.Columns.Contains("IsEditing"))
                    dtQuizzes.Columns.Add("IsEditing", typeof(bool));

                foreach (DataRow row in dtQuizzes.Rows)
                    row["IsEditing"] = false;

                rptQuizzes.DataSource = dtQuizzes;
                rptQuizzes.DataBind();
            }
        }

        protected void rptQuizzes_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int quizId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Edit")
                ToggleEdit(quizId, true);
            else if (e.CommandName == "Cancel")
                ToggleEdit(quizId, false);
            else if (e.CommandName == "Update")
            {
                TextBox txtTitle = (TextBox)e.Item.FindControl("txtTitle");
                TextBox txtDesc = (TextBox)e.Item.FindControl("txtDescription");
                DropDownList ddlTutorial = (DropDownList)e.Item.FindControl("ddlTutorial");

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"UPDATE Quizzes SET Title=@Title, Description=@Desc, TutorialID=@Tid
                                     WHERE QuizID=@ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@Desc", txtDesc.Text);
                    cmd.Parameters.AddWithValue("@Tid", ddlTutorial.SelectedValue);
                    cmd.Parameters.AddWithValue("@ID", quizId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                ToggleEdit(quizId, false);
            }
            else if (e.CommandName == "Delete")
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "DELETE FROM Quizzes WHERE QuizID=@ID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ID", quizId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                LoadQuizzes();
            }
        }

        private void ToggleEdit(int quizId, bool isEditing)
        {
            LoadQuizzes();
            foreach (DataRow row in dtQuizzes.Rows)
                if ((int)row["QuizID"] == quizId)
                    row["IsEditing"] = isEditing;

            rptQuizzes.DataSource = dtQuizzes;
            rptQuizzes.DataBind();
        }

        protected void rptQuizzes_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddlTutorial = (DropDownList)e.Item.FindControl("ddlTutorial");
                if (ddlTutorial != null)
                {
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        SqlCommand cmd = new SqlCommand("SELECT TutorialID, Title FROM Tutorials", conn);
                        conn.Open();
                        ddlTutorial.DataSource = cmd.ExecuteReader();
                        ddlTutorial.DataTextField = "Title";
                        ddlTutorial.DataValueField = "TutorialID";
                        ddlTutorial.DataBind();
                        ddlTutorial.SelectedValue = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "TutorialID"));
                    }
                }
            }
        }
    }
}