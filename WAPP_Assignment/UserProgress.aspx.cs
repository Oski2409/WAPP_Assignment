using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WAPP_Assignment
{
    public partial class UserProgress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadProgress();
            }
        
        }
        private void LoadProgress()
        {
            int userId = Session["UserID"] != null ? Convert.ToInt32(Session["UserID"]) : 0;
            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Total quizzes
                SqlCommand totalCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Quizzes", conn);

                int totalQuizzes = (int)totalCmd.ExecuteScalar();

                // Completed quizzes (distinct)
                SqlCommand completedCmd = new SqlCommand(
                    "SELECT COUNT(DISTINCT QuizID) FROM QuizAttempts WHERE UserID=@UserID", conn);

                completedCmd.Parameters.AddWithValue("@UserID", userId);
                int completed = (int)completedCmd.ExecuteScalar();

                // Average score
                SqlCommand avgCmd = new SqlCommand(
                    "SELECT ISNULL(AVG(Score),0) FROM QuizAttempts WHERE UserID=@UserID", conn);

                avgCmd.Parameters.AddWithValue("@UserID", userId);
                double avgScore = Convert.ToDouble(avgCmd.ExecuteScalar());

                // Best score
                SqlCommand bestCmd = new SqlCommand(
                    "SELECT ISNULL(MAX(Score),0) FROM QuizAttempts WHERE UserID=@UserID", conn);

                bestCmd.Parameters.AddWithValue("@UserID", userId);
                int bestScore = Convert.ToInt32(bestCmd.ExecuteScalar());

                // Completion %
                int completionRate = totalQuizzes == 0 ? 0 : (completed * 100) / totalQuizzes;

                // Bind to UI
                lblTotalQuizzes.Text = totalQuizzes.ToString();
                lblCompleted.Text = completed.ToString();
                lblCompletionRate.Text = completionRate + "%";
                lblAvgScore.Text = Math.Round(avgScore, 1) + "%";
                lblBestScore.Text = bestScore + "%";

                progressBar.Style["width"] = completionRate + "%";
                progressBar.InnerText = completionRate + "%";


                // Load quiz breakdown
                SqlCommand breakdownCmd = new SqlCommand(@"
                SELECT q.Title AS QuizTitle,
                       MAX(qa.Score) AS Score
                FROM QuizAttempts qa
                INNER JOIN Quizzes q ON qa.QuizID = q.QuizID
                WHERE qa.UserID = @UserID
                GROUP BY q.Title
            ", conn);

                breakdownCmd.Parameters.AddWithValue("@UserID", userId);

                SqlDataReader reader = breakdownCmd.ExecuteReader();

                List<dynamic> quizList = new List<dynamic>();

                while (reader.Read())
                {
                    quizList.Add(new
                    {
                        QuizTitle = reader["QuizTitle"].ToString(),
                        Score = reader["Score"].ToString()
                    });
                }

                rptQuizBreakdown.DataSource = quizList;
                rptQuizBreakdown.DataBind();
            }


        }
    }
}
    
