<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryTutorials.aspx.cs" Inherits="WAPP_Assignment.CategoryTutorials" %>

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

    <h2 class="mb-4">
        <asp:Label ID="lblCategoryTitle" runat="server"></asp:Label>
    </h2>

    <div class="row" id="tutorialContainer" runat="server">
    </div>

</asp:Content>