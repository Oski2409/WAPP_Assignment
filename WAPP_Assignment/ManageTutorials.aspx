<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="ManageTutorials.aspx.cs"
    Inherits="WAPP_Assignment.Pages.ManageTutorials" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-4">Manage Tutorials</h2>

<!-- Add New Tutorial Inline -->
<div class="card bg-dark text-white mb-3 p-3 shadow-sm">
    <h5>Add New Tutorial</h5>
    <div class="mb-2"><asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="Title" /></div>
    <div class="mb-2"><asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" Placeholder="Description" /></div>
    <div class="mb-2"><asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="form-control" Placeholder="Content Text" /></div>
    <div class="mb-2"><asp:TextBox ID="txtVideo" runat="server" CssClass="form-control" Placeholder="Video URL" /></div>
    <div class="mb-2"><asp:TextBox ID="txtImage" runat="server" CssClass="form-control" Placeholder="Image URL" /></div>
    <div class="mb-2"><asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" Placeholder="Category ID" /></div>
    <asp:Button ID="btnAddTutorial" runat="server" CssClass="btn btn-success" Text="Add Tutorial" OnClick="btnAddTutorial_Click" />
</div>

<!-- Tutorials Repeater -->
<asp:Repeater ID="rptTutorials" runat="server" OnItemCommand="rptTutorials_ItemCommand">
    <ItemTemplate>
        <div class="card bg-dark text-white mb-3 p-3 shadow-sm">
            <!-- View Mode -->
            <asp:Panel ID="pnlView" runat="server" Visible='<%# !(bool)Eval("IsEditing") %>'>
                <h5 class="card-title"><%# Eval("Title") %></h5>
                <p class="card-text"><strong>Description:</strong> <%# Eval("Description") %></p>
                <p class="card-text"><strong>Content:</strong> <%# Eval("ContentText") %></p>
                <p class="card-text"><strong>Video URL:</strong> <%# Eval("VideoURL") %></p>
                <p class="card-text"><strong>Image URL:</strong> <%# Eval("ImageURL") %></p>
                <p class="card-text"><strong>Category ID:</strong> <%# Eval("CategoryID") %></p>
                <p class="card-text"><strong>Created By:</strong> <%# Eval("CreatedBy") %></p>
                <p class="card-text"><strong>Created On:</strong> <%# Eval("CreatedDate", "{0:dd/MM/yyyy}") %></p>
                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("TutorialID") %>' CssClass="btn btn-warning btn-sm me-2" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("TutorialID") %>' CssClass="btn btn-danger btn-sm" />
            </asp:Panel>

            <!-- Edit Mode -->
            <asp:Panel ID="pnlEdit" runat="server" Visible='<%# (bool)Eval("IsEditing") %>'>
                <div class="mb-2"><asp:TextBox ID="txtEditTitle" runat="server" CssClass="form-control" Text='<%# Eval("Title") %>' /></div>
                <div class="mb-2"><asp:TextBox ID="txtEditDesc" runat="server" CssClass="form-control" Text='<%# Eval("Description") %>' /></div>
                <div class="mb-2"><asp:TextBox ID="txtEditContent" runat="server" CssClass="form-control" Text='<%# Eval("ContentText") %>' /></div>
                <div class="mb-2"><asp:TextBox ID="txtEditVideo" runat="server" CssClass="form-control" Text='<%# Eval("VideoURL") %>' /></div>
                <div class="mb-2"><asp:TextBox ID="txtEditImage" runat="server" CssClass="form-control" Text='<%# Eval("ImageURL") %>' /></div>
                <div class="mb-2"><asp:TextBox ID="txtEditCategory" runat="server" CssClass="form-control" Text='<%# Eval("CategoryID") %>' /></div>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" CommandArgument='<%# Eval("TutorialID") %>' CssClass="btn btn-success btn-sm me-2" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument='<%# Eval("TutorialID") %>' CssClass="btn btn-secondary btn-sm" />
            </asp:Panel>
        </div>
    </ItemTemplate>
</asp:Repeater>

</asp:Content>