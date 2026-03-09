using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



namespace WAPP_Assignment.Pages
{
    public partial class Quiz : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string category = Request.QueryString["category"];

                if (!string.IsNullOrEmpty(category))
                {
                    pnlCategories.Visible = false;
                    pnlTutorials.Visible = true;

                    LoadTutorialQuizzes(Convert.ToInt32(category));
                }
                else
                {
                    pnlCategories.Visible = true;
                    pnlTutorials.Visible = false;
                }
            }
        }

        private void LoadTutorialQuizzes(int categoryId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
            SELECT q.QuizID,
                   q.Title,
                   ISNULL(
                       (SELECT TOP 1 Score 
                        FROM QuizAttempts 
                        WHERE QuizID = q.QuizID 
                        AND UserID = @UserID
                        ORDER BY AttemptDate DESC), '-') AS LastScore
            FROM Quizzes q
            INNER JOIN Tutorials t ON q.TutorialID = t.TutorialID
            WHERE t.CategoryID = @CategoryID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CategoryID", categoryId);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                var list = new List<dynamic>();

                while (reader.Read())
                {
                    string score = reader["LastScore"].ToString();

                    list.Add(new
                    {
                        QuizID = reader["QuizID"],
                        Title = reader["Title"],
                        CompletionStatus = score == "-" ? "Not Attempted" : "Completed",
                        StatusClass = score == "-" ? "text-danger" : "text-success",
                        LastScore = score == "-" ? "-" : score + "%"
                    });
                }

                rptTutorialQuizzes.DataSource = list;
                rptTutorialQuizzes.DataBind();
            }
        }
    }
}