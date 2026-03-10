<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="ManageUsers.aspx.cs"
    Inherits="WAPP_Assignment.Pages.ManageUsers" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-4">Manage Users</h2>

<!-- Add New User Inline -->
<div class="card bg-dark text-white mb-3 p-3 shadow-sm">
    <h5>Add New User</h5>
    <div class="row mb-2">
        <div class="col"><asp:TextBox ID="txtNewFullName" runat="server" CssClass="form-control" Placeholder="Full Name" /></div>
        <div class="col"><asp:TextBox ID="txtNewEmail" runat="server" CssClass="form-control" Placeholder="Email" /></div>
        <div class="col"><asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Password" /></div>
        <div class="col">
            <asp:DropDownList ID="ddlNewRole" runat="server" CssClass="form-select">
                <asp:ListItem Value="RegisteredUser">RegisteredUser</asp:ListItem>
                <asp:ListItem Value="Admin">Admin</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col">
            <asp:DropDownList ID="ddlNewStatus" runat="server" CssClass="form-select">
                <asp:ListItem Value="Active">Active</asp:ListItem>
                <asp:ListItem Value="Suspended">Suspended</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col">
            <asp:Button ID="btnAddUser" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btnAddUser_Click" />
        </div>
    </div>
</div>

<!-- Users Grid -->
<asp:GridView ID="gvUsers" runat="server" CssClass="table table-dark table-striped"
    AutoGenerateColumns="False" DataKeyNames="UserID"
    OnRowEditing="gvUsers_RowEditing" OnRowCancelingEdit="gvUsers_RowCancelingEdit"
    OnRowUpdating="gvUsers_RowUpdating" OnRowDeleting="gvUsers_RowDeleting">
    <Columns>
        <asp:BoundField DataField="UserID" HeaderText="User ID" ReadOnly="True" />
        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="Role" HeaderText="Role" />
        <asp:BoundField DataField="AccountStatus" HeaderText="Status" />
        <asp:BoundField DataField="RegistrationDate" HeaderText="Registered On" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>

</asp:Content>