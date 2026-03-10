using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace WAPP_Assignment.Pages
{
    public partial class Tutorials : Page
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
                LoadTutorials(0);
            }

        }

        private void LoadTutorials(int categoryID)
        {

            using (SqlConnection conn = new SqlConnection(connStr))
            {

                string query;

                if (categoryID == 0)
                    query = "SELECT TutorialID, Title, Description, ImageURL FROM Tutorials";
                else
                    query = "SELECT TutorialID, Title, Description, ImageURL FROM Tutorials WHERE CategoryID=@CategoryID";

                SqlCommand cmd = new SqlCommand(query, conn);

                if (categoryID != 0)
                    cmd.Parameters.AddWithValue("@CategoryID", categoryID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                rptTutorials.DataSource = dt;

                rptTutorials.DataBind();

            }

        }

        protected void FilterCategory(object sender, EventArgs e)
        {

            string buttonText = ((System.Web.UI.WebControls.LinkButton)sender).Text;

            int categoryID = 0;

            if (buttonText.Contains("Photography"))
                categoryID = 1;

            else if (buttonText.Contains("Videography"))
                categoryID = 2;

            else if (buttonText.Contains("Lighting"))
                categoryID = 3;

            else if (buttonText.Contains("Editing"))
                categoryID = 4;

            LoadTutorials(categoryID);

        }

    }
}