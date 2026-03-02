<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WAPP_Assignment.Pages.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container py-5">

        <!-- Page Header -->
        <div class="text-center mb-5">
            <h1 class="fw-bold text-warning">About SmartClicks</h1>
            <p class="lead">
                Empowering creativity through structured photography education.
            </p>
        </div>

        <!-- Mission Section -->
        <div class="row align-items-center mb-5">
            <div class="col-md-6">
                <h3 class="text-warning">🎯 Our Mission</h3>
                <p>
                    SmartClicks is a photography learning platform designed to help beginners
                    and aspiring creatives master camera techniques, lighting setups,
                    videography principles, and editing skills.
                </p>
                <p>
                    We combine structured tutorials with interactive quizzes to reinforce
                    understanding and improve practical knowledge.
                </p>
            </div>

            <div class="col-md-6 text-center">
                <img src="Images/about-camera.jpg" class="img-fluid rounded shadow" alt="Photography">
            </div>
        </div>

        <!-- What We Offer -->
        <div class="row text-center mb-5">
            <div class="col-md-3">
                <h4 class="text-warning">📸 Photography</h4>
                <p>Learn landscape, portrait, wildlife, and architectural techniques.</p>
            </div>

            <div class="col-md-3">
                <h4 class="text-warning">🎥 Videography</h4>
                <p>Master composition, camera angles, frame rate and stabilization.</p>
            </div>

            <div class="col-md-3">
                <h4 class="text-warning">💡 Lighting</h4>
                <p>Understand natural lighting and professional 3-point lighting setups.</p>
            </div>

            <div class="col-md-3">
                <h4 class="text-warning">🎨 Editing</h4>
                <p>Enhance visuals with color grading, VFX, and post-production techniques.</p>
            </div>
        </div>

        <!-- Team Section -->
        <div class="text-center">
            <h3 class="text-warning mb-4">👨‍💻 Our Team</h3>
            <p>
                Developed by students passionate about technology and creativity.
                This project demonstrates full-stack web development using ASP.NET Web Forms,
                SQL Server, and Bootstrap UI design.
            </p>
        </div>

    </div>

</asp:Content>