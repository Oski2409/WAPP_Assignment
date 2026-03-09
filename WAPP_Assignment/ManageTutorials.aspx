<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="ManageTutorials.aspx.cs"
    Inherits="WAPP_Assignment.Pages.ManageTutorials" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-4">Manage Tutorials</h2>

<asp:Repeater ID="rptTutorials" runat="server" OnItemCommand="rptTutorials_ItemCommand" OnItemDataBound="rptTutorials_ItemDataBound">
    <ItemTemplate>
        <div class="card bg-dark text-white mb-3 shadow-sm p-3">
            <!-- View Mode -->
            <asp:Panel ID="pnlView" runat="server" Visible='<%# !(Eval("IsEditing") != DBNull.Value && Convert.ToBoolean(Eval("IsEditing"))) %>'>
                <h5 class="card-title"><%# Convert.ToString(Eval("Title")) %></h5>
                <p class="card-text"><strong>Description:</strong> <%# Convert.ToString(Eval("Description")) %></p>
                <p class="card-text"><strong>Content:</strong> <%# Convert.ToString(Eval("ContentText")) %></p>
                <p class="card-text"><strong>Video:</strong> <%# Convert.ToString(Eval("VideoURL")) %></p>
                <p class="card-text"><strong>Image:</strong> <%# Convert.ToString(Eval("ImageURL")) %></p>
                <p class="card-text"><strong>Category:</strong> <%# Convert.ToString(Eval("CategoryName")) %></p>
                <p class="card-text"><strong>Created By:</strong> <%# Convert.ToString(Eval("CreatedBy")) %></p>
                <p class="card-text"><strong>Created On:</strong> <%# Eval("CreatedDate", "{0:dd/MM/yyyy}") %></p>
                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-warning btn-sm" CommandName="Edit" CommandArgument='<%# Eval("TutorialID") %>' />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm" CommandName="Delete" CommandArgument='<%# Eval("TutorialID") %>' OnClientClick="return confirm('Delete this tutorial?');" />
            </asp:Panel>

            <!-- Edit Mode -->
            <asp:Panel ID="pnlEdit" runat="server" Visible='<%# Eval("IsEditing") != DBNull.Value && Convert.ToBoolean(Eval("IsEditing")) %>'>
                <div class="mb-2">
                    <label>Title:</label>
                    <asp:TextBox ID="txtTitle" runat="server" Text='<%# Convert.ToString(Eval("Title")) %>' CssClass="form-control" />
                </div>
                <div class="mb-2">
                    <label>Description:</label>
                    <asp:TextBox ID="txtDescription" runat="server" Text='<%# Convert.ToString(Eval("Description")) %>' CssClass="form-control" />
                </div>
                <div class="mb-2">
                    <label>Content:</label>
                    <asp:TextBox ID="txtContent" runat="server" Text='<%# Convert.ToString(Eval("ContentText")) %>' TextMode="MultiLine" CssClass="form-control" Rows="3" />
                </div>
                <div class="mb-2">
                    <label>Video URL:</label>
                    <asp:TextBox ID="txtVideo" runat="server" Text='<%# Convert.ToString(Eval("VideoURL")) %>' CssClass="form-control" />
                </div>
                <div class="mb-2">
                    <label>Image URL:</label>
                    <asp:TextBox ID="txtImage" runat="server" Text='<%# Convert.ToString(Eval("ImageURL")) %>' CssClass="form-control" />
                </div>
                <div class="mb-2">
                    <label>Category:</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success btn-sm" CommandName="Update" CommandArgument='<%# Eval("TutorialID") %>' />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary btn-sm" CommandName="Cancel" CommandArgument='<%# Eval("TutorialID") %>' />
            </asp:Panel>
        </div>
    </ItemTemplate>
</asp:Repeater>

</asp:Content>