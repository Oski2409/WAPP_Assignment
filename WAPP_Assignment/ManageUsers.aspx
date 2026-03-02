<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="WAPP_Assignment.Pages.ManageUsers" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-4">Manage Users</h2>

<div class="card bg-dark text-white p-4 shadow">
    <asp:GridView ID="gvUsers"
        runat="server"
        CssClass="table table-dark table-striped">
    </asp:GridView>
</div>

</asp:Content>
