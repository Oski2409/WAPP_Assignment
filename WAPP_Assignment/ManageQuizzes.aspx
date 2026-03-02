<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageQuizzes.aspx.cs" Inherits="WAPP_Assignment.Pages.ManageQuizzes" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-4">Manage Quizzes</h2>

<div class="card bg-dark text-white p-4 mb-4 shadow">
    <h4>Create Quiz</h4>

    <div class="mb-3">
        <label>Select Tutorial</label>
        <asp:DropDownList ID="ddlTutorials"
            runat="server"
            CssClass="form-control custom-input" />
    </div>

    <div class="mb-3">
        <label>Quiz Title</label>
        <asp:TextBox ID="txtQuizTitle"
            runat="server"
            CssClass="form-control custom-input" />
    </div>

    <div class="mb-3">
        <label>Description</label>
        <asp:TextBox ID="txtQuizDesc"
            runat="server"
            CssClass="form-control custom-input"
            TextMode="MultiLine" Rows="3" />
    </div>

    <asp:Button runat="server"
        Text="Create Quiz"
        CssClass="btn btn-warning mt-3" />
</div>

    <div class="mb-3">
        <label>Select Quiz</label>
        <asp:DropDownList ID="ddlQuizzes"
            runat="server"
            CssClass="form-control custom-input" />
    </div>

<!-- Add New Quiz Question -->
<div class="card bg-dark text-white p-4 mb-4 shadow">
    <h4>Add New Quiz Question</h4>

    <div class="mb-3">
        <label>Question</label>
        <asp:TextBox runat="server" CssClass="form-control custom-input" TextMode="MultiLine" Rows="3" />
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <label>Option A</label>
            <asp:TextBox runat="server" CssClass="form-control custom-input" />
        </div>

        <div class="col-md-6 mb-3">
            <label>Option B</label>
            <asp:TextBox runat="server" CssClass="form-control custom-input" />
        </div>

        <div class="col-md-6 mb-3">
            <label>Option C</label>
            <asp:TextBox runat="server" CssClass="form-control custom-input" />
        </div>

        <div class="col-md-6 mb-3">
            <label>Option D</label>
            <asp:TextBox runat="server" CssClass="form-control custom-input" />
        </div>
    </div>

    <div class="mb-3">
        <label>Correct Answer</label>
        <asp:DropDownList runat="server" CssClass="form-control custom-input">
            <asp:ListItem Text="Option A" />
            <asp:ListItem Text="Option B" />
            <asp:ListItem Text="Option C" />
            <asp:ListItem Text="Option D" />
        </asp:DropDownList>
    </div>

    <asp:Button runat="server" Text="Add Question"
        CssClass="btn btn-warning mt-3" />
</div>

<!-- Display Existing Questions -->
<div class="card bg-dark text-white p-4 shadow">
    <h4>Existing Quiz Questions</h4>

    <asp:GridView ID="gvQuizzes"
        runat="server"
        CssClass="table table-dark table-striped mt-3">
    </asp:GridView>
</div>

</asp:Content>