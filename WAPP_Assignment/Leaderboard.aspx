<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Leaderboard.aspx.cs"
    Inherits="WAPP_Assignment.Leaderboard" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-warning mb-4">🏆 Leaderboard</h2>

    <div class="card bg-dark text-white p-4 shadow-lg">

        <asp:GridView ID="gvLeaderboard" runat="server"
            CssClass="table table-dark table-striped text-center"
            AutoGenerateColumns="true">
        </asp:GridView>

    </div>

</asp:Content>