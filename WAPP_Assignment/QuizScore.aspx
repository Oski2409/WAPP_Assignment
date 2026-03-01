<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuizScore.aspx.cs" Inherits="WAPP_Assignment.QuizScore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb bg-dark p-3 rounded shadow-sm">
            <li class="breadcrumb-item">
                <a href="Default.aspx" class="text-warning">Home</a>
            </li>
            <li class="breadcrumb-item">
                <a href="Tutorials.aspx" class="text-warning">Tutorials</a>
            </li>
            <li class="breadcrumb-item active text-white">Current Page
        </li>
        </ol>
    </nav>

    <div class="text-center mt-5">

        <h2 class="mb-4">Quiz Results</h2>

        <div class="card bg-dark text-white shadow mx-auto" style="max-width: 500px;">
            <div class="card-body">

                <h3 class="mb-3">Your Score</h3>

                <!-- This will later be dynamic -->
                <h1 class="display-4 text-warning">8 / 10</h1>

                <p class="mt-3">
                    Great job! You have a good understanding of this topic.
                </p>

                <a href="Tutorials.aspx" class="btn btn-outline-light mt-4 me-2">
                    Back to Tutorials
                </a>

                <a href="TakeQuiz.aspx" class="btn btn-warning mt-4">
                    Retake Quiz
                </a>

            </div>
        </div>

    </div>

</asp:Content>