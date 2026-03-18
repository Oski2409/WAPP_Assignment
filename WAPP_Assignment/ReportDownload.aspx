<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="ReportDownload.aspx.cs"
    Inherits="WAPP_Assignment.Pages.ReportDownload" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-4">📄 Admin Reports</h2>

<div class="card bg-dark text-white p-4 shadow-lg">

    <div class="mb-3">
        <label>Select Report Type:</label>
        <asp:DropDownList ID="ddlReportType" runat="server" CssClass="form-control">
            <asp:ListItem Value="Users">Users Report</asp:ListItem>
            <asp:ListItem Value="Scores">Leaderboard Report</asp:ListItem>
            <asp:ListItem Value="Badges">Badges Report</asp:ListItem>
        </asp:DropDownList>
    </div>

    <asp:Button ID="btnDownload"
        runat="server"
        Text="Download Report"
        CssClass="btn btn-warning"
        OnClick="btnDownload_Click" />

</div>

</asp:Content>