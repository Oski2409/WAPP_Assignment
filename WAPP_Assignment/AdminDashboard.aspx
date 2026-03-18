<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="WAPP_Assignment.Pages.AdminDashboard" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-5">Admin Dashboard</h2>

<div class="row text-center">

    <div class="col-md-4 mb-4">
    <div class="card admin-card shadow-lg border-0">
        <h4>📚 Manage Tutorials</h4>
        <p>Add, update, or delete tutorial records.</p>
        <a href="ManageTutorials.aspx" class="btn btn-warning mt-3">
            Manage
        </a>
    </div>
</div>

<div class="col-md-4 mb-4">
    <div class="card admin-card shadow-lg border-0">
        <h4>👤 Manage Users</h4>
        <p>Control user access and account status.</p>
        <a href="ManageUsers.aspx" class="btn btn-warning mt-3">
            Manage
        </a>
    </div>
</div>

<div class="col-md-4 mb-4">
    <div class="card admin-card shadow-lg border-0">
        <h4>📝 Manage Quizzes</h4>
        <p>Create, update or delete quiz questions.</p>
        <a href="ManageQuizzes.aspx" class="btn btn-warning mt-3">
            Manage
        </a>
    </div>
</div>
<div class="col-md-4 mb-4">
    <div class="card admin-card shadow-lg border-0">
            <h4>📄 Reports</h4>
            <p>Download system reports and analytics.</p>
            <a href="ReportDownload.aspx" class="btn btn-warning mt-3">
                Open
            </a>
        </div>
</div>
</div>

</asp:Content>