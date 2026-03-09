<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="ManageTutorials.aspx.cs"
    Inherits="WAPP_Assignment.Pages.ManageTutorials" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-4">Manage Tutorials</h2>

<div class="card bg-dark text-white shadow-lg border-0 p-3">

    <asp:GridView ID="gvTutorials"
        runat="server"
        CssClass="table table-dark table-striped"
        AutoGenerateColumns="False"
        DataKeyNames="TutorialID"
        OnRowEditing="gvTutorials_RowEditing"
        OnRowCancelingEdit="gvTutorials_RowCancelingEdit"
        OnRowUpdating="gvTutorials_RowUpdating"
        OnRowDeleting="gvTutorials_RowDeleting"
        OnRowDataBound="gvTutorials_RowDataBound">

        <Columns>
            <asp:BoundField DataField="TutorialID" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="ContentText" HeaderText="Content" />
            <asp:BoundField DataField="VideoURL" HeaderText="Video URL" />
            <asp:BoundField DataField="ImageURL" HeaderText="Image URL" />

            <asp:TemplateField HeaderText="Category">
                <ItemTemplate>
                    <%# Eval("CategoryName") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="CreatedBy" HeaderText="Created By" ReadOnly="True" />
            <asp:BoundField DataField="CreatedDate" HeaderText="Created On" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}" />

            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>

    </asp:GridView>

</div>

</asp:Content>