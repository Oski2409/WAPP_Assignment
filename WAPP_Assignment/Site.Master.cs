using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isLoggedIn = Session["UserID"] != null;
            string role = Session["Role"] != null ? Session["Role"].ToString() : "";

            // Guest
            if (!isLoggedIn)
            {
                navLogin.Visible = true;
                navRegister.Visible = true;

                navTutorials.Visible = false;
                navQuiz.Visible = false;
                navProfile.Visible = false;
                navLogout.Visible = false;
                navProgress.Visible = false;
            }
            else
            {
                // Logged in
                navLogin.Visible = false;
                navRegister.Visible = false;

                navProfile.Visible = true;
                navLogout.Visible = true;
                navProgress.Visible = true;

                if (role == "Admin")
                {
                    // Admin sees Admin Dashboard instead of Tutorials
                    navTutorials.Visible = false;
                    navQuiz.Visible = false;
                }
                else
                {
                    // Normal registered user
                    navTutorials.Visible = true;
                    navQuiz.Visible = true;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e) 
        { 
            Session.Clear(); 
            Response.Redirect("Default.aspx"); 
        }
    }
}