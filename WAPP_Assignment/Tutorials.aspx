<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true" CodeBehind="Tutorials.aspx.cs"
Inherits="WAPP_Assignment.Pages.Tutorials" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-center mb-5">Browse Tutorial Categories</h2>

<div class="row mb-5 text-center">

<asp:Repeater ID="rptCategories" runat="server">

<ItemTemplate>

<div class="col-md-3 mb-4">

<asp:LinkButton runat="server"
CssClass="category-card text-decoration-none d-block"
Style="font-size:1.6rem; padding:45px 20px;"
CommandArgument='<%# Eval("CategoryID") %>'
OnClick="FilterCategory">

<div style="font-size:2.5rem;">
<%# GetCategoryIcon(Eval("CategoryName").ToString()) %>
</div>

<%# Eval("CategoryName") %>

</asp:LinkButton>

</div>

</ItemTemplate>

</asp:Repeater>

</div>


<!-- Tutorial Cards -->
<div class="row">

<asp:Repeater ID="rptTutorials" runat="server">

<ItemTemplate>

<div class="col-md-6 col-lg-4 mb-4">

<div class="card bg-dark text-white shadow h-100">

<img src='<%# Eval("ImageURL") %>'
class="card-img-top"
style="height:200px;object-fit:cover;" />

<div class="card-body">

<h5 class="card-title">
<%# Eval("Title") %>
</h5>

<p class="card-text">
<%# Eval("Description") %>
</p>

<a href='ViewTutorial.aspx?id=<%# Eval("TutorialID") %>'
class="btn btn-warning">
View Tutorial
</a>

</div>

</div>

</div>

</ItemTemplate>

</asp:Repeater>

</div>

</asp:Content>