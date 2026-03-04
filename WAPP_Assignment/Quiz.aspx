<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="WAPP_Assignment.Pages.Quiz" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="container mt-5">

    <h2 class="text-warning mb-4">Self Assessment Quiz</h2>

    <!-- CATEGORY SECTION -->
    <asp:Panel ID="pnlCategories" runat="server">
        <div class="row">

            <div class="col-md-3 mb-4">
                <div class="card category-card text-center p-4">
                    <h4>📸 Photography</h4>
                    <a href="Quiz.aspx?category=1" class="btn btn-warning mt-3">
                        View Quizzes
                    </a>
                </div>
            </div>

            <div class="col-md-3 mb-4">
                <div class="card category-card text-center p-4">
                    <h4>🎥 Videography</h4>
                    <a href="Quiz.aspx?category=2" class="btn btn-warning mt-3">
                        View Quizzes
                    </a>
                </div>
            </div>

            <div class="col-md-3 mb-4">
                <div class="card category-card text-center p-4">
                    <h4>💡 Lighting</h4>
                    <a href="Quiz.aspx?category=3" class="btn btn-warning mt-3">
                        View Quizzes
                    </a>
                </div>
            </div>

            <div class="col-md-3 mb-4">
                <div class="card category-card text-center p-4">
                    <h4>🎨 Editing</h4>
                    <a href="Quiz.aspx?category=4" class="btn btn-warning mt-3">
                        View Quizzes
                    </a>
                </div>
            </div>

        </div>
    </asp:Panel>

    <!-- TUTORIAL QUIZ LIST -->
    <asp:Panel ID="pnlTutorials" runat="server" Visible="false">

        <h4 class="text-light mb-4">Select Tutorial Quiz</h4>

        <asp:Repeater ID="rptTutorialQuizzes" runat="server">
            <ItemTemplate>
                <div class="card bg-dark text-white p-4 mb-3 shadow">

                    <h5><%# Eval("Title") %></h5>

                    <p>
                        Status:
                        <span class='<%# Eval("StatusClass") %>'>
                            <%# Eval("CompletionStatus") %>
                        </span>
                    </p>

                    <p>
                        Last Score:
                        <span class="text-warning">
                            <%# Eval("LastScore") %>
                        </span>
                    </p>

                    <a href='TakeQuiz.aspx?quizId=<%# Eval("QuizID") %>'
                       class="btn btn-warning mt-2">
                        Start / Redo Quiz
                    </a>

                </div>
            </ItemTemplate>
        </asp:Repeater>

        <a href="Quiz.aspx" class="btn btn-outline-light mt-3">
            ⬅ Back to Categories
        </a>

    </asp:Panel>

</div>

</asp:Content>
