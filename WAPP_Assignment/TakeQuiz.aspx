<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TakeQuiz.aspx.cs" Inherits="WAPP_Assignment.Pages.TakeQuiz" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

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

    <h2 class="mb-4">Self-Assessment Quiz</h2>

    <div class="card bg-dark text-white shadow mb-4">
        <div class="card-body">

            <h5>1. What does ISO control in photography?</h5>

            <asp:RadioButtonList ID="rbQuestion1" runat="server" CssClass="mt-3">
                <asp:ListItem>Light sensitivity</asp:ListItem>
                <asp:ListItem>Zoom level</asp:ListItem>
                <asp:ListItem>Lens focus</asp:ListItem>
                <asp:ListItem>White balance</asp:ListItem>
            </asp:RadioButtonList>

        </div>
    </div>

    <div class="card bg-dark text-white shadow mb-4">
        <div class="card-body">

            <h5>2. A low f-number means:</h5>

            <asp:RadioButtonList ID="rbQuestion2" runat="server" CssClass="mt-3">
                <asp:ListItem>Less light enters</asp:ListItem>
                <asp:ListItem>More light enters</asp:ListItem>
                <asp:ListItem>Faster shutter</asp:ListItem>
                <asp:ListItem>Lower ISO</asp:ListItem>
            </asp:RadioButtonList>

        </div>
    </div>

    <div class="text-center mt-4">
        <asp:Button ID="btnSubmit" runat="server"
            Text="Submit Quiz"
            CssClass="btn btn-warning btn-lg" />
    </div>

</asp:Content>
