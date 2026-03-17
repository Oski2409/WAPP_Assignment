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

    </div>

</div>

</asp:Content>