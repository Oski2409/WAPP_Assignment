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
            if (Session["UserID"] != null)
            {
                // Logged in user
                navLogin.Visible = false;
                navRegister.Visible = false;
                navTutorials.Visible = true;
                navQuiz.Visible = true;
                navLogout.Visible = true;
            }
            else
            {
                // Guest
                navLogin.Visible = true;
                navRegister.Visible = true;
                navTutorials.Visible = false;
                navQuiz.Visible = false;
                navLogout.Visible = false;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}