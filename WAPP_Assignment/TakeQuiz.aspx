<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TakeQuiz.aspx.cs" Inherits="WAPP_Assignment.Pages.TakeQuiz" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="container mt-5">

    <h2 class="text-warning mb-4">Quiz</h2>

    <asp:Repeater ID="rptQuestions" runat="server" OnItemDataBound="rptQuestions_ItemDataBound">
        <ItemTemplate>

            <div class="card bg-dark text-white shadow-lg border-0">

                <h5><%# Eval("QuestionText") %></h5>

                <asp:RadioButtonList ID="rblOptions"
                    runat="server"
                    CssClass="mt-3"
                    RepeatDirection="Vertical">
                </asp:RadioButtonList>

                <asp:HiddenField ID="hfCorrectAnswer"
                    runat="server"
                    Value='<%# Eval("CorrectAnswer") %>' />

            </div>

        </ItemTemplate>
    </asp:Repeater>

    <asp:Button ID="btnSubmit"
        runat="server"
        Text="Submit Quiz"
        CssClass="btn btn-warning mt-3"
        OnClick="btnSubmit_Click" />

</div>

</asp:Content>