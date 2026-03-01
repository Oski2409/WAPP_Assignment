<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WAPP_Assignment.Pages.Register" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card bg-dark text-white shadow-lg p-4">
                <h3 class="text-center mb-4">Create Account</h3>

                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="txtName" runat="server"
                        CssClass="form-control bg-dark text-white border-secondary" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server"
                        CssClass="form-control bg-dark text-white border-secondary" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server"
                        TextMode="Password"
                        CssClass="form-control bg-dark text-white border-secondary" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Confirm Password</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server"
                        TextMode="Password"
                        CssClass="form-control bg-dark text-white border-secondary" />
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />

                <div class="text-center mt-4">
                    <asp:Button ID="btnRegister"
                        runat="server"
                        Text="Register"
                        CssClass="btn btn-warning w-100"
                        OnClick="btnRegister_Click" />
                </div>

            </div>

        </div>
    </div>

</asp:Content>
