<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tutorials.aspx.cs" Inherits="WAPP_Assignment.Pages.Tutorials" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-center mb-5">Browse Tutorial Categories</h2>

    <div class="row justify-content-center">

        <div class="col-md-5 col-lg-3 mb-4">
            <a href="CategoryTutorials.aspx?Category=Photography"
               class="text-decoration-none">
                <div class="category-card text-center p-5 rounded">
                    <h3>📸 Photography</h3>
                </div>
            </a>
        </div>

        <div class="col-md-5 col-lg-3 mb-4">
            <a href="CategoryTutorials.aspx?Category=Videography"
               class="text-decoration-none">
                <div class="category-card text-center p-5 rounded">
                    <h3>🎬 Videography</h3>
                </div>
            </a>
        </div>

        <div class="col-md-5 col-lg-3 mb-4">
            <a href="CategoryTutorials.aspx?Category=Lighting"
               class="text-decoration-none">
                <div class="category-card text-center p-5 rounded">
                    <h3>💡 Lighting</h3>
                </div>
            </a>
        </div>

        <div class="col-md-5 col-lg-3 mb-4">
            <a href="CategoryTutorials.aspx?Category=Editing"
               class="text-decoration-none">
                <div class="category-card text-center p-5 rounded">
                    <h3>🎨 Editing</h3>
                </div>
            </a>
        </div>

    </div>

</asp:Content>