using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WAPP_Assignment.Pages
{
    public partial class ManageQuizzes : System.Web.UI.Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
{
                LoadTutorials();
                LoadQuizzes();
                LoadQuizDropdown();
            }
        }

        // Load all Tutorials into the DropDownList
        private void LoadTutorials()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT TutorialID, Title FROM Tutorials", conn);
                conn.Open();
                ddlTutorial.DataSource = cmd.ExecuteReader();
                ddlTutorial.DataTextField = "Title";        // Display text
                ddlTutorial.DataValueField = "TutorialID";  // Value to insert
                ddlTutorial.DataBind();
            }
        }
        private void LoadQuizDropdown()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT QuizID, Title FROM Quizzes", conn);

                conn.Open();

                ddlQuiz.DataSource = cmd.ExecuteReader();
                ddlQuiz.DataTextField = "Title";
                ddlQuiz.DataValueField = "QuizID";
                ddlQuiz.DataBind();
            }
        }

        // Load all Quizzes into the repeater
        private void LoadQuizzes()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT q.QuizID, q.Title, q.Description, t.Title AS TutorialTitle
                    FROM Quizzes q
                    INNER JOIN Tutorials t ON q.TutorialID = t.TutorialID
                    ORDER BY q.QuizID DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptQuizzes.DataSource = dt;
                rptQuizzes.DataBind();
            }
        }

        // Add new Quiz
        protected void btnAddQuiz_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtQuizTitle.Text) || ddlTutorial.SelectedIndex < 0)
                return; // basic validation

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    INSERT INTO Quizzes (TutorialID, Title, Description, CreatedBy, CreatedDate)
                    VALUES (@TutorialID, @Title, @Desc, @CreatedBy, GETDATE())";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TutorialID", ddlTutorial.SelectedValue);
                cmd.Parameters.AddWithValue("@Title", txtQuizTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@Desc", txtQuizDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@CreatedBy", 1); // default admin

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Clear fields
            txtQuizTitle.Text = txtQuizDesc.Text = "";
            ddlTutorial.SelectedIndex = 0;

            // Reload list
            LoadQuizzes();
            LoadQuizDropdown();
        }

        // add new question
        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            if (ddlQuiz.SelectedIndex < 0)
            {
                return;
            }
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"INSERT INTO Questions
                        (QuizID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectAnswer)
                        VALUES
                        (@QuizID, @Question, @A, @B, @C, @D, @Correct)";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@QuizID", ddlQuiz.SelectedValue);
                cmd.Parameters.AddWithValue("@Question", txtQuestion.Text.Trim());
                cmd.Parameters.AddWithValue("@A", txtOptionA.Text.Trim());
                cmd.Parameters.AddWithValue("@B", txtOptionB.Text.Trim());
                cmd.Parameters.AddWithValue("@C", txtOptionC.Text.Trim());
                cmd.Parameters.AddWithValue("@D", txtOptionD.Text.Trim());
                cmd.Parameters.AddWithValue("@Correct", ddlCorrectAnswer.SelectedValue);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            txtQuestion.Text = "";
            txtOptionA.Text = "";
            txtOptionB.Text = "";
            txtOptionC.Text = "";
            txtOptionD.Text = "";
        }
    }
}