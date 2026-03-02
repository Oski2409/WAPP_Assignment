<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WAPP_Assignment.Pages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="login-wrapper d-flex justify-content-center align-items-center">

    <div class="login-card p-5 shadow-lg">

        <h2 class="text-center text-white mb-4">LOGIN</h2>
        <p class="text-center text-muted mb-4">
            Please enter your login credentials
        </p>

        <div class="mb-3">
            <label class="form-label text-white">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control custom-input" />
        </div>

        <div class="mb-4">
            <label class="form-label text-white">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control custom-input" />
        </div>

        <div class="text-center">
            <asp:Button ID="btnLogin"
                runat="server"
                Text="Login"
                CssClass="btn custom-login-btn"
                OnClick="btnLogin_Click" />
        </div>

        <div class="text-center mt-3">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
        </div>

    </div>

</div>

</asp:Content>