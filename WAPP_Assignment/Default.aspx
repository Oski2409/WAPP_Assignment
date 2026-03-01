<%@ Page Title="Home"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="WAPP_Assignment._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-center mt-5">

        <h1 class="display-4 fw-bold">Master Photography Skills</h1>
        <p class="lead mt-3">
            Learn lighting, composition, camera settings and creative techniques
            through structured tutorials and interactive quizzes.
        </p>

        <a href="Login.aspx" class="btn btn-warning btn-lg mt-4 me-3">
            Start Learning
        </a>

        <a href="Register.aspx" class="btn btn-outline-light btn-lg mt-4">
            Join Now
        </a>

    </div>

    <hr class="my-5" />

    <div class="row text-center">

        <div class="col-md-4">
            <h3>📸 Tutorials</h3>
            <p>Step-by-step photography lessons with real-world examples.</p>
        </div>

        <div class="col-md-4">
            <h3>🎥 Video Guides</h3>
            <p>Watch professional tips and technique breakdowns.</p>
        </div>

        <div class="col-md-4">
            <h3>📝 Self-Assessment</h3>
            <p>Test your understanding with interactive quizzes.</p>
        </div>

    </div>

</asp:Content>