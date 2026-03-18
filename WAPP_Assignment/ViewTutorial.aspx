<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewTutorial.aspx.cs" Inherits="WAPP_Assignment.ViewTutorial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<nav aria-label="breadcrumb">
    <ol class="breadcrumb bg-dark p-3 rounded">
        <li class="breadcrumb-item">
            <a href="Default.aspx" class="text-warning">Home</a>
        </li>
        <li class="breadcrumb-item">
            <a href="Tutorials.aspx" class="text-warning">Tutorials</a>
        </li>
        <li class="breadcrumb-item active text-white">
            <asp:Label ID="lblTitleBreadcrumb" runat="server"></asp:Label>
        </li>
    </ol>
</nav>

<!-- Tutorial Header -->
<div class="mb-4">
    <h2 class="fw-bold">
        <asp:Label ID="lblTitle" runat="server"></asp:Label>
    </h2>

    <p class="text-muted">
        <asp:Label ID="lblCategory" runat="server"></asp:Label>
    </p>
</div>

<h3> testing </h3>

    
    <p class="text-muted">
        <asp:Label ID="Label2" runat="server"></asp:Label>
    </p>


<!-- Tutorial Image -->
<div class="mb-4 text-center">
    <asp:Image ID="imgTutorial" runat="server"
        CssClass="img-fluid rounded shadow"
        Width="800px" />
</div>

<!-- Tutorial Content -->
<div class="mb-5">
    <asp:Literal ID="litContent" runat="server"></asp:Literal>
</div>

<!-- Video Section -->
<div class="mb-5 text-center">

    <h4 class="mb-3">Watch Tutorial Video</h4>

    <div class="ratio ratio-16x9">
        <asp:Literal ID="litVideo" runat="server"></asp:Literal>
    </div>

</div>



</asp:Content>