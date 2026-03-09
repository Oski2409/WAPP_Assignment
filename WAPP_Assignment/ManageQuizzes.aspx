<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="ManageQuizzes.aspx.cs"
    Inherits="WAPP_Assignment.Pages.ManageQuizzes" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-4">Manage Quizzes</h2>

<asp:Repeater ID="rptQuizzes" runat="server" OnItemCommand="rptQuizzes_ItemCommand" OnItemDataBound="rptQuizzes_ItemDataBound">
    <ItemTemplate>
        <div class="card bg-dark text-white mb-3 shadow-sm p-3">
            <asp:Panel ID="pnlView" runat="server" Visible='<%# !(Eval("IsEditing") != DBNull.Value && Convert.ToBoolean(Eval("IsEditing"))) %>'>
                <h5 class="card-title"><%# Convert.ToString(Eval("Title")) %></h5>
                <p class="card-text"><strong>Description:</strong> <%# Convert.ToString(Eval("Description")) %></p>
                <p class="card-text"><strong>Tutorial:</strong> <%# Convert.ToString(Eval("TutorialTitle")) %></p>
                <p class="card-text"><strong>Created By:</strong> <%# Convert.ToString(Eval("CreatedBy")) %></p>
                <p class="card-text"><strong>Created On:</strong> <%# Eval("CreatedDate", "{0:dd/MM/yyyy}") %></p>
                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-warning btn-sm" CommandName="Edit" CommandArgument='<%# Eval("QuizID") %>' />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm" CommandName="Delete" CommandArgument='<%# Eval("QuizID") %>' OnClientClick="return confirm('Delete this quiz?');" />
            </asp:Panel>

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
                    <label>Tutorial:</label>
                    <asp:DropDownList ID="ddlTutorial" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success btn-sm" CommandName="Update" CommandArgument='<%# Eval("QuizID") %>' />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary btn-sm" CommandName="Cancel" CommandArgument='<%# Eval("QuizID") %>' />
            </asp:Panel>
        </div>
    </ItemTemplate>
</asp:Repeater>

</asp:Content>