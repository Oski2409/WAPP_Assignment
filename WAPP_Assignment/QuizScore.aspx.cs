using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

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
                int score = Convert.ToInt32(Session["Score"]);              // correct answers
                int total = Convert.ToInt32(Session["TotalQuestions"]);     // total questions
                int percentage = Convert.ToInt32(Session["Percentage"]);    // % score

                int wrong = total - score;

                lblScore.Text = $"{score} / {total}";
                lblDetails.Text = $"Correct: {score} | Wrong: {wrong} | {percentage}%";

                int quizId = Convert.ToInt32(Request.QueryString["quizId"]);
                int userId = Convert.ToInt32(Session["UserID"]);

                

                string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                   

                    // 🔹 GET QUIZ TITLE
                    SqlCommand quizCmd = new SqlCommand(
                        "SELECT Title FROM Quizzes WHERE QuizID=@QuizID", conn);

                    quizCmd.Parameters.AddWithValue("@QuizID", quizId);
                    lblQuizTitle.Text = quizCmd.ExecuteScalar().ToString();

                    // 🔹 COUNT QUESTIONS
                    SqlCommand qCount = new SqlCommand(
                        "SELECT COUNT(*) FROM Questions WHERE QuizID=@QuizID", conn);

                    qCount.Parameters.AddWithValue("@QuizID", quizId);
                    lblTotalQuestions.Text = qCount.ExecuteScalar().ToString();
                }

                // 🔥 AWARD BADGES
                CheckAndAwardBadges(userId);

                // 🔹 MESSAGE
                if (percentage >= 80)
                {
                    lblMessage.Text = "Excellent work! You have strong knowledge of this topic.";
                }
                else if (percentage >= 50)
                {
                    lblMessage.Text = "Good attempt! Review the tutorial to improve.";
                }
                else
                {
                    lblMessage.Text = "Keep practicing! Try reviewing the tutorial again.";
                }


                var questions = Session["Questions"] as List<string>;
                var userAnswers = Session["UserAnswers"] as List<string>;
                var correctAnswers = Session["CorrectAnswers"] as List<string>;

                var reviewList = new List<dynamic>();
                Response.Write("Questions count: " + questions.Count);

                if (questions != null && userAnswers != null && correctAnswers != null)
                {
                   

                    for (int i = 0; i < questions.Count; i++)
                    {
                        reviewList.Add(new
                        {
                            Question = questions[i],
                            UserAnswer = userAnswers[i],
                            CorrectAnswer = correctAnswers[i],
                            IsCorrect = userAnswers[i] == correctAnswers[i]
                        });
                    }

                    rptReview.DataSource = reviewList;
                    rptReview.DataBind();
                }
            }
        }
            private void CheckAndAwardBadges(int userId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Total Score
                string scoreQuery = "SELECT ISNULL(SUM(Score),0) FROM QuizAttempts WHERE UserID=@UserID";
                SqlCommand cmdScore = new SqlCommand(scoreQuery, conn);
                cmdScore.Parameters.AddWithValue("@UserID", userId);
                int totalScore = Convert.ToInt32(cmdScore.ExecuteScalar());

                // Attempt Count
                string countQuery = "SELECT COUNT(*) FROM QuizAttempts WHERE UserID=@UserID";
                SqlCommand cmdCount = new SqlCommand(countQuery, conn);
                cmdCount.Parameters.AddWithValue("@UserID", userId);
                int attempts = Convert.ToInt32(cmdCount.ExecuteScalar());

                // Award badges
                if (attempts >= 1) AwardBadge(userId, 1);
                if (attempts >= 5) AwardBadge(userId, 2);
                if (totalScore >= 100) AwardBadge(userId, 3);
                if (totalScore >= 300) AwardBadge(userId, 4);
            }
        }

        private void AwardBadge(int userId, int badgeId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string checkQuery = "SELECT COUNT(*) FROM UserBadges WHERE UserID=@U AND BadgeID=@B";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@U", userId);
                checkCmd.Parameters.AddWithValue("@B", badgeId);

                int exists = (int)checkCmd.ExecuteScalar();

                if (exists == 0)
                {
                    string insertQuery = "INSERT INTO UserBadges (UserID, BadgeID) VALUES (@U, @B)";
                    SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                    insertCmd.Parameters.AddWithValue("@U", userId);
                    insertCmd.Parameters.AddWithValue("@B", badgeId);
                    insertCmd.ExecuteNonQuery();
                }
            }
        }
    }
}
    