using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Pages
{
    public partial class TakeQuiz : Page
    {
        int quizId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!int.TryParse(Request.QueryString["quizId"], out quizId))
            {
                Response.Redirect("Quiz.aspx");
            }

            if (!IsPostBack)
            {
                LoadQuestions();
            }
        }

        private void LoadQuestions()
        {
            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Questions WHERE QuizID = @QuizID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@QuizID", quizId);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                rptQuestions.DataSource = reader;
                rptQuestions.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int score = 0;
            int totalQuestions = rptQuestions.Items.Count;

            foreach (RepeaterItem item in rptQuestions.Items)
            {
                RadioButtonList rbl = (RadioButtonList)item.FindControl("rblOptions");
                HiddenField hf = (HiddenField)item.FindControl("hfCorrectAnswer");

                if (rbl.SelectedValue == hf.Value)
                {
                    score++;
                }
            }

            int finalScore = (score * 100) / totalQuestions;

            SaveAttempt(finalScore);

            Response.Redirect("QuizScore.aspx?score=" + finalScore);
        }

        private void SaveAttempt(int score)
        {
            string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"INSERT INTO QuizAttempts 
                                (UserID, QuizID, Score, AttemptDate)
                                VALUES (@UserID, @QuizID, @Score, GETDATE())";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@QuizID", quizId);
                cmd.Parameters.AddWithValue("@Score", score);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void rptQuestions_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RadioButtonList rbl = (RadioButtonList)e.Item.FindControl("rblOptions");

                string optionA = DataBinder.Eval(e.Item.DataItem, "OptionA").ToString();
                string optionB = DataBinder.Eval(e.Item.DataItem, "OptionB").ToString();
                string optionC = DataBinder.Eval(e.Item.DataItem, "OptionC").ToString();
                string optionD = DataBinder.Eval(e.Item.DataItem, "OptionD").ToString();

                rbl.Items.Add(new ListItem(optionA, "A"));
                rbl.Items.Add(new ListItem(optionB, "B"));
                rbl.Items.Add(new ListItem(optionC, "C"));
                rbl.Items.Add(new ListItem(optionD, "D"));
            }
        }
    }
}