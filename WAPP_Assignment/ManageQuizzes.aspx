<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="ManageQuizzes.aspx.cs"
    Inherits="WAPP_Assignment.Pages.ManageQuizzes" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<h2 class="text-warning mb-4">Manage Quizzes</h2>

<div class="card bg-dark text-white shadow-lg border-0 p-3">

    <asp:GridView ID="gvQuizzes"
        runat="server"
        CssClass="table table-dark table-striped"
        AutoGenerateColumns="False"
        DataKeyNames="QuizID"
        OnRowEditing="gvQuizzes_RowEditing"
        OnRowCancelingEdit="gvQuizzes_RowCancelingEdit"
        OnRowUpdating="gvQuizzes_RowUpdating"
        OnRowDeleting="gvQuizzes_RowDeleting"
        OnRowDataBound="gvQuizzes_RowDataBound">

        <Columns>
            <asp:BoundField DataField="QuizID" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" />

            <asp:TemplateField HeaderText="Tutorial">
                <ItemTemplate>
                    <%# Eval("TutorialTitle") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTutorial" runat="server"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="CreatedBy" HeaderText="Created By" ReadOnly="True" />
            <asp:BoundField DataField="CreatedDate" HeaderText="Created On" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}" />

            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>

    </asp:GridView>

</div>

</asp:Content>