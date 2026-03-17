using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace WAPP_Assignment.Pages
{
    public partial class ReportDownload : System.Web.UI.Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            string reportType = ddlReportType.SelectedValue;
            string query = "";

            if (reportType == "Users")
            {
                query = @"SELECT UserID, FullName, Email, Role, AccountStatus, RegistrationDate FROM Users";
            }
            else if (reportType == "Scores")
            {
                query = @"SELECT U.FullName, SUM(S.Score) AS TotalScore, COUNT(S.ScoreID) AS QuizzesTaken
                          FROM Users U
                          JOIN Scores S ON U.UserID = S.UserID
                          GROUP BY U.FullName
                          ORDER BY TotalScore DESC";
            }
            else if (reportType == "Badges")
            {
                query = @"SELECT U.FullName, B.BadgeName, UB.DateEarned
                          FROM UserBadges UB
                          JOIN Users U ON UB.UserID = U.UserID
                          JOIN Badges B ON UB.BadgeID = B.BadgeID";
            }

            ExportToCSV(query, reportType);
        }

        private void ExportToCSV(string query, string reportName)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=" + reportName + "Report.csv");
                Response.Charset = "";
                Response.ContentType = "application/text";

                StringBuilder sb = new StringBuilder();

                // Column headers
                foreach (DataColumn col in dt.Columns)
                {
                    sb.Append(col.ColumnName + ",");
                }
                sb.Append("\n");

                // Rows
                foreach (DataRow row in dt.Rows)
                {
                    foreach (var item in row.ItemArray)
                    {
                        sb.Append(item.ToString() + ",");
                    }
                    sb.Append("\n");
                }

                Response.Write(sb.ToString());
                Response.Flush();
                Response.End();
            }
        }
    }
}