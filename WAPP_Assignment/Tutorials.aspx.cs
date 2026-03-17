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
                LoadCategories();
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

        public string GetCategoryIcon(string name)
        {
            if (name.Contains("Camera"))
                return "📸";

            if (name.Contains("Composition"))
                return "🎬";

            if (name.Contains("Lighting"))
                return "💡";

            if (name.Contains("Smartphone"))
                return "🎨";

            return "📷";
        }

        public string GetDisplayName(string dbName)
        {
            if (dbName.Contains("Camera"))
                return "Photography";

            if (dbName.Contains("Lighting"))
                return "Lighting";

            if (dbName.Contains("Composition"))
                return "Videography";

            if (dbName.Contains("Smartphone"))
                return "Editing";

            return dbName;
        }

        private void LoadCategories()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT CategoryID, CategoryName FROM Categories WHERE CategoryName IS NOT NULL";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptCategories.DataSource = dt;
                rptCategories.DataBind();
            }
        }

        protected void FilterCategory(object sender, EventArgs e)
        {
            int categoryID = Convert.ToInt32(((System.Web.UI.WebControls.LinkButton)sender).CommandArgument);

            LoadTutorials(categoryID);
        }

    }
}