<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WAPP_Assignment.Pages.Profile" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="login-wrapper d-flex justify-content-center align-items-center">

    <div class="login-card p-5 shadow-lg">

        <h2 class="text-center mb-4">My Profile</h2>

        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="text-success text-center d-block mb-3" />

        <div class="mb-3">
            <label>Full Name</label>
            <asp:TextBox ID="txtFullName"
                runat="server"
                CssClass="form-control custom-input" />
        </div>

        <div class="mb-3">
            <label>Email</label>
            <asp:TextBox ID="txtEmail"
                runat="server"
                CssClass="form-control custom-input" />
        </div>

        <div class="mb-3">
            <label>New Password</label>
            <asp:TextBox ID="txtPassword"
                runat="server"
                TextMode="Password"
                CssClass="form-control custom-input" />
        </div>

        <div class="mb-4">
            <label>Confirm New Password</label>
            <asp:TextBox ID="txtConfirmPassword"
                runat="server"
                TextMode="Password"
                CssClass="form-control custom-input" />
        </div>

        <div class="text-center">
            <asp:Button ID="btnUpdate"
                runat="server"
                Text="Update Profile"
                CssClass="btn custom-login-btn"
                OnClick="btnUpdate_Click" />
        </div>

    </div>

</div>

</asp:Content>