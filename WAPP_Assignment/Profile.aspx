<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WAPP_Assignment.Pages.Profile" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="login-wrapper d-flex justify-content-center align-items-center">
    <div class="login-card p-5 shadow-lg">
        <h2 class="text-center mb-4">My Profile</h2>
        <asp:Label ID="lblMessage" runat="server" CssClass="text-success text-center d-block mb-3" />

        <div class="mb-3">
            <label>Full Name</label>
            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control custom-input" />
        </div>
        <div class="mb-3">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control custom-input" />
        </div>

        <hr />
        <h5 class="mb-3">Change Password</h5>

        <%-- Current Password (shown from DB, read-only) --%>
        <div class="mb-3">
            <label>Current Password</label>
            <div class="input-group">
                <asp:TextBox ID="txtCurrentPassword" runat="server"
                    TextMode="Password"
                    CssClass="form-control custom-input"
                    Style="background-color: #2a2a2a; color: white;" />
                <button type="button" class="btn btn-outline-secondary"
                    onclick="toggleVisibility(this)">
                    <i class="bi bi-eye"></i>
                </button>
            </div>
            <small class="text-muted">This is your current password.</small>
        </div>

        <%-- Send OTP button --%>
        <div class="mb-3">
            <asp:Button ID="btnSendOtp" runat="server" Text="Send OTP to Email"
                CssClass="btn btn-secondary w-100"
                OnClick="btnSendOtp_Click" />
        </div>

        <%-- OTP input - hidden until sent --%>
        <div class="mb-3" id="otpSection" runat="server" visible="false">
            <label>Enter OTP</label>
            <asp:TextBox ID="txtOtp" runat="server" CssClass="form-control custom-input"
                placeholder="6-digit code" MaxLength="6" />
            <small class="text-muted">OTP expires in 5 minutes.</small>
        </div>

        <%-- New password fields - hidden until OTP sent --%>
        <div id="newPasswordSection" runat="server" visible="false">
            <div class="mb-3">
                <label>New Password</label>
                <div class="input-group">
                    <asp:TextBox ID="txtPassword" runat="server"
                        TextMode="Password"
                        CssClass="form-control custom-input" />
                    <button type="button" class="btn btn-outline-secondary"
                        onclick="togglePassword('txtPassword', this)">
                        <i class="bi bi-eye"></i>
                    </button>
                </div>
            </div>
            <div class="mb-4">
                <label>Confirm New Password</label>
                <div class="input-group">
                    <asp:TextBox ID="txtConfirmPassword" runat="server"
                        TextMode="Password"
                        CssClass="form-control custom-input" />
                    <button type="button" class="btn btn-outline-secondary"
                        onclick="togglePassword('txtConfirmPassword', this)">
                        <i class="bi bi-eye"></i>
                    </button>
                </div>
            </div>
        </div>

        <div class="text-center">
            <asp:Button ID="btnUpdate" runat="server" Text="Update Profile"
                CssClass="btn custom-login-btn"
                OnClick="btnUpdate_Click" />
        </div>
    </div>
</div>

<script>
    function toggleVisibility(btn) {
        var field = btn.closest('.input-group').querySelector('input');
        if (field.type === 'password') {
            field.type = 'text';
            btn.innerHTML = '<i class="bi bi-eye-slash"></i>';
        } else {
            field.type = 'password';
            btn.innerHTML = '<i class="bi bi-eye"></i>';
        }
    }
</script>
</asp:Content>