<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="UserProgress.aspx.cs"
Inherits="WAPP_Assignment.UserProgress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container mt-5">

    <h2 class="text-warning mb-4">Your Learning Progress</h2>

    <div class="card bg-dark text-white p-4 shadow">

        <p>Total Quizzes: <asp:Label ID="lblTotalQuizzes" runat="server" /></p>
        <p>Completed Quizzes: <asp:Label ID="lblCompleted" runat="server" /></p>
        <p>Completion Rate: <asp:Label ID="lblCompletionRate" runat="server" /></p>
        <p>Average Score: <asp:Label ID="lblAvgScore" runat="server" /></p>
        <p>Best Score: <asp:Label ID="lblBestScore" runat="server" /></p>

        <!-- Progress Bar -->
        <div class="progress mt-3">
            <div id="progressBar" runat="server"
                 class="progress-bar bg-warning"
                 role="progressbar"
                 style="width:0%">
            </div>
        </div>

        <!-- QUIZ BREAKDOWN -->
<div class="mt-4">

    <button class="btn btn-outline-warning w-100 mb-2" type="button" data-bs-toggle="collapse" data-bs-target="#quizBreakdown">
        ▼ View Completed Quizzes
    </button>

    <div class="collapse" id="quizBreakdown">

        <asp:Repeater ID="rptQuizBreakdown" runat="server">
            <ItemTemplate>

                <div class="card bg-secondary text-white p-3 mb-2 shadow-sm">

                    <h6 class="mb-1">
                        <%# Eval("QuizTitle") %>
                    </h6>

                    <p class="mb-0 text-warning">
                        Score: <%# Eval("Score") %>%
                    </p>

                </div>

            </ItemTemplate>
        </asp:Repeater>

    </div>

</div>

    </div>

</div>

</asp:Content>