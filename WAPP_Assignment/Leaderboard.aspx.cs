using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WAPP_Assignment
{
    public partial class Leaderboard : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLeaderboard();
            }
        }

        private void LoadLeaderboard()
        {
            string query = @"
                SELECT 
                    ROW_NUMBER() OVER (ORDER BY SUM(QA.Score) DESC) AS Rank,
                    U.FullName,
                    SUM(QA.Score) AS TotalScore,
                    COUNT(QA.AttemptID) AS QuizzesTaken
                FROM Users U
                JOIN QuizAttempts QA ON U.UserID = QA.UserID
                GROUP BY U.FullName";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvLeaderboard.DataSource = dt;
                gvLeaderboard.DataBind();
            }
        }
    }
}