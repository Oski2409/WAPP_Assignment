<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WAPP_Assignment.Pages.Register" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="login-wrapper d-flex justify-content-center align-items-center">

    <div class="login-card p-5 shadow-lg">

        <h2 class="text-center mb-4">Create Account</h2>

        <asp:Label ID="lblMessage" runat="server"
            CssClass="text-danger text-center d-block mb-3" />

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
            <label>Password</label>
            <asp:TextBox ID="txtPassword"
                runat="server"
                TextMode="Password"
                CssClass="form-control custom-input" />

            <asp:RegularExpressionValidator
                ID="revPassword"
                runat="server"
                ControlToValidate="txtPassword"
                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
                ErrorMessage="Password must be at least 8 characters and contain letters and numbers."
                ForeColor="Red"
                Display="Dynamic" />
        </div>

        <div class="mb-4">
            <label>Confirm Password</label>
            <asp:TextBox ID="txtConfirmPassword"
                runat="server"
                TextMode="Password"
                CssClass="form-control custom-input" />
        </div>

        <div class="text-center">
            <asp:Button ID="btnRegister"
                runat="server"
                Text="Register"
                CssClass="btn custom-login-btn"
                OnClick="btnRegister_Click" />
        </div>

    </div>

</div>

</asp:Content>
