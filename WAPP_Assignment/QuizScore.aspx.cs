using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment
{
    public partial class QuizScore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                int score = Convert.ToInt32(Request.QueryString["score"]);
                int quizId = Convert.ToInt32(Request.QueryString["quizId"]);

                lblScore.Text = score + "%";

                string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // Get Quiz Title
                    SqlCommand quizCmd = new SqlCommand(
                        "SELECT Title FROM Quizzes WHERE QuizID=@QuizID", conn);

                    quizCmd.Parameters.AddWithValue("@QuizID", quizId);

                    lblQuizTitle.Text = quizCmd.ExecuteScalar().ToString();

                    // Count Questions
                    SqlCommand qCount = new SqlCommand(
                        "SELECT COUNT(*) FROM Questions WHERE QuizID=@QuizID", conn);

                    qCount.Parameters.AddWithValue("@QuizID", quizId);

                    lblTotalQuestions.Text = qCount.ExecuteScalar().ToString();
                }

                if (score >= 80)
                {
                    lblMessage.Text = "Excellent work! You have strong knowledge of this topic.";
                }
                else if (score >= 50)
                {
                    lblMessage.Text = "Good attempt! Review the tutorial to improve.";
                }
                else
                {
                    lblMessage.Text = "Keep practicing! Try reviewing the tutorial again.";
                }
            }
        }
    }
}
    

    
