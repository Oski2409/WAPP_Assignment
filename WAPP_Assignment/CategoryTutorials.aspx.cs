using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment
{
    public partial class CategoryTutorials : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string category = Request.QueryString["Category"];

            lblCategoryTitle.Text = category + " Tutorials";

            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                if (category == "Photography")
                {
                    AddCard("Landscape Photography", "1");
                    AddCard("Wildlife Photography", "2");
                    AddCard("Portrait Photography", "3");
                    AddCard("Street Photography", "4");
                    AddCard("Architectural Photography", "5");
                }
                else if (category == "Videography")
                {
                    AddCard("Composition", "6");
                    AddCard("Frame Rate", "7");
                    AddCard("Audio", "8");
                    AddCard("Camera Angles", "9");
                    AddCard("Stabilization", "10");
                }
                else if (category == "Lighting")
                {
                    AddCard("Natural Lighting", "11");
                    AddCard("3-Point Lighting", "12");
                    AddCard("Ambient Lighting", "13");
                    AddCard("Lighting Gear & Equipment", "14");
                }
                else if (category == "Editing")
                {
                    AddCard("Colour Grading", "15");
                    AddCard("Audio Mixing", "16");
                    AddCard("Visual Effects (VFX)", "17");
                }
            }
        }

        private void AddCard(string title, string tutorialID)
        {
            tutorialContainer.InnerHtml += $@"
        <div class='col-md-4 mb-4'>
            <div class='card bg-dark text-white shadow-lg border-0 h-100'>
                <img src='Images/sample.jpg' 
                     class='card-img-top' 
                     alt='{title}'>
                <div class='card-body d-flex flex-column'>
                    <h5 class='card-title'>{title}</h5>
                    <p class='card-text'>
                        Learn key techniques and practical applications.
                    </p>
                    <a href='ViewTutorial.aspx?TutorialID={tutorialID}'
                       class='btn btn-warning mt-auto w-100'>
                       View Tutorial
                    </a>
                </div>
            </div>
        </div>";
        }
    }
}