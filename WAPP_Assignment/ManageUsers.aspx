<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="ManageUsers.aspx.cs"
    Inherits="WAPP_Assignment.Pages.ManageUsers" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-4">Manage Users</h2>

<div class="card bg-dark text-white shadow-lg border-0">

    <asp:GridView ID="gvUsers"
        runat="server"
        CssClass="table table-dark table-striped"
        AutoGenerateColumns="False"
        DataKeyNames="UserID"
        OnRowEditing="gvUsers_RowEditing"
        OnRowCancelingEdit="gvUsers_RowCancelingEdit"
        OnRowUpdating="gvUsers_RowUpdating"
        OnRowDeleting="gvUsers_RowDeleting">

        <Columns>

            <asp:BoundField DataField="UserID" HeaderText="User ID" ReadOnly="True" />

            <asp:BoundField DataField="FullName" HeaderText="Full Name" />

            <asp:BoundField DataField="Email" HeaderText="Email" />

            <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <%# Eval("Role") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlRole" runat="server">
                        <asp:ListItem>RegisteredUser</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <%# Eval("AccountStatus") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Suspended</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="RegistrationDate"
                HeaderText="Registered On"
                ReadOnly="True"
                DataFormatString="{0:dd/MM/yyyy}" />

            <asp:CommandField ShowEditButton="True"
                              ShowDeleteButton="True" />

        </Columns>
    </asp:GridView>

</div>

</asp:Content>