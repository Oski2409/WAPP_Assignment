<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageTutorials.aspx.cs" Inherits="WAPP_Assignment.Pages.ManageTutorials" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-4">Manage Tutorials</h2>

<!-- Add New Tutorial -->
<div class="card bg-dark text-white shadow-lg border-0">
    <h4>Add New Tutorial</h4>

    <div class="row">
        <div class="col-md-4 mb-3">
            <label>Title</label>
            <asp:TextBox runat="server" CssClass="form-control custom-input" />
        </div>

        <div class="col-md-4 mb-3">
            <label>Category</label>
            <asp:TextBox runat="server" CssClass="form-control custom-input" />
        </div>

        <div class="col-md-4 mb-3">
            <label>Video URL</label>
            <asp:TextBox runat="server" CssClass="form-control custom-input" />
        </div>
    </div>

    <asp:Button runat="server" Text="Add Tutorial"
        CssClass="btn btn-warning mt-3" />
</div>

<!-- Display Tutorials -->
<div class="card bg-dark text-white shadow-lg border-0">
    <h4>Existing Tutorials</h4>

    <asp:GridView ID="gvTutorials"
        runat="server"
        CssClass="table table-dark table-striped mt-3">
    </asp:GridView>
</div>

</asp:Content>
