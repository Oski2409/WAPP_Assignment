using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Later this will validate against database

            if (txtEmail.Text == "test@test.com" && txtPassword.Text == "1234")
            {
                Session["UserID"] = "1";
                Response.Redirect("Tutorials.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid email or password.";
            }
        }
    }
}