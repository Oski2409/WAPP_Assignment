using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Pages
{
    public partial class Quiz : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string category = Request.QueryString["category"];

                if (!string.IsNullOrEmpty(category))
                {
                    pnlCategories.Visible = false;
                    pnlTutorials.Visible = true;

                    LoadDummyTutorials();
                }
                else
                {
                    pnlCategories.Visible = true;
                    pnlTutorials.Visible = false;
                }
            }
        }

        private void LoadDummyTutorials()
        {
            var tutorials = new List<dynamic>
            {
                new {
                    QuizID = 1,
                    Title = "Landscape Photography Quiz",
                    CompletionStatus = "Completed",
                    StatusClass = "text-success",
                    LastScore = "80%"
                },
                new {
                    QuizID = 2,
                    Title = "Wildlife Photography Quiz",
                    CompletionStatus = "Not Attempted",
                    StatusClass = "text-danger",
                    LastScore = "-"
                },
                new {
                    QuizID = 3,
                    Title = "Portrait Photography Quiz",
                    CompletionStatus = "Completed",
                    StatusClass = "text-success",
                    LastScore = "90%"
                }
            };

            rptTutorialQuizzes.DataSource = tutorials;
            rptTutorialQuizzes.DataBind();
        }
    }
}