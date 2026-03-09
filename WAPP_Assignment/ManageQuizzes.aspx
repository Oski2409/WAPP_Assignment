<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="ManageQuizzes.aspx.cs"
    Inherits="WAPP_Assignment.Pages.ManageQuizzes" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-4">Manage Quizzes</h2>

<!-- Add New Quiz Inline -->
<div class="card bg-dark text-white mb-3 p-3 shadow-sm">
    <h5>Add New Quiz</h5>
    <div class="mb-2">
        <asp:TextBox ID="txtQuizTitle" runat="server" CssClass="form-control" Placeholder="Quiz Title" />
    </div>
    <div class="mb-2">
        <asp:TextBox ID="txtQuizDesc" runat="server" CssClass="form-control" Placeholder="Quiz Description" />
    </div>
    <div class="mb-2">
        <asp:DropDownList ID="ddlTutorial" runat="server" CssClass="form-select" />
    </div>
    <asp:Button ID="btnAddQuiz" runat="server" CssClass="btn btn-success" Text="Add Quiz" OnClick="btnAddQuiz_Click" />
</div>

    <!-- Add Question Section -->
<div class="card bg-dark text-white mb-3 p-3 shadow-sm">
    <h5>Add Question</h5>

    <div class="mb-2">
        <asp:DropDownList ID="ddlQuiz" runat="server" CssClass="form-select" />
    </div>

    <div class="mb-2">
        <asp:TextBox ID="txtQuestion" runat="server"
            CssClass="form-control"
            Placeholder="Question Text" />
    </div>

    <div class="mb-2">
        <asp:TextBox ID="txtOptionA" runat="server"
            CssClass="form-control"
            Placeholder="Option A" />
    </div>

    <div class="mb-2">
        <asp:TextBox ID="txtOptionB" runat="server"
            CssClass="form-control"
            Placeholder="Option B" />
    </div>

    <div class="mb-2">
        <asp:TextBox ID="txtOptionC" runat="server"
            CssClass="form-control"
            Placeholder="Option C" />
    </div>

    <div class="mb-2">
        <asp:TextBox ID="txtOptionD" runat="server"
            CssClass="form-control"
            Placeholder="Option D" />
    </div>

    <div class="mb-2">
        <asp:DropDownList ID="ddlCorrectAnswer"
            runat="server"
            CssClass="form-select">
            <asp:ListItem Text="A" Value="A" />
            <asp:ListItem Text="B" Value="B" />
            <asp:ListItem Text="C" Value="C" />
            <asp:ListItem Text="D" Value="D" />
        </asp:DropDownList>
    </div>

    <asp:Button ID="btnAddQuestion"
        runat="server"
        CssClass="btn btn-warning"
        Text="Add Question"
        OnClick="btnAddQuestion_Click" />
</div>

<!-- Quizzes List -->
<asp:Repeater ID="rptQuizzes" runat="server">
    <ItemTemplate>
        <div class="card bg-dark text-white mb-3 p-3 shadow-sm">
            <h5><%# Eval("Title") %></h5>
            <p><%# Eval("Description") %></p>
            <p><strong>Tutorial:</strong> <%# Eval("TutorialTitle") %></p>
        </div>
    </ItemTemplate>
</asp:Repeater>

</asp:Content>