using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WAPP_Assignment
{
    public partial class ViewTutorial : System.Web.UI.Page
    {

        string connStr = ConfigurationManager.ConnectionStrings["SmartClicksDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadTutorial();
            }

        }

        private void LoadTutorial()
        {

            if (Request.QueryString["id"] == null)
                return;

            int tutorialID = Convert.ToInt32(Request.QueryString["id"]);

            using (SqlConnection conn = new SqlConnection(connStr))
            {

                string query = "SELECT * FROM Tutorials WHERE TutorialID=@ID";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@ID", tutorialID);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {

                    lblTitle.Text = dr["Title"].ToString();

                    lblTitleBreadcrumb.Text = dr["Title"].ToString();

                    imgTutorial.ImageUrl = dr["ImageURL"].ToString();

                    litContent.Text =
                        "<h4>Description</h4><p>" + dr["Description"].ToString() + "</p>" +
                        "<h4>Lesson</h4><p>" + dr["ContentText"].ToString() + "</p>";

                    string videoURL = dr["VideoURL"].ToString();

                    videoURL = videoURL.Replace("watch?v=", "embed/");

                    litVideo.Text =
                        "<iframe src='" + videoURL + "' allowfullscreen></iframe>";


                }

            }

        }

    }
}