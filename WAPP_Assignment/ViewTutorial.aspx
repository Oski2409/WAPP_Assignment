<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewTutorial.aspx.cs" Inherits="WAPP_Assignment.ViewTutorial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-dark p-3 rounded">
            <li class="breadcrumb-item">
                <a href="Default.aspx" class="text-warning">Home</a>
            </li>
            <li class="breadcrumb-item">
                <a href="Tutorials.aspx" class="text-warning">Tutorials</a>
            </li>
            <li class="breadcrumb-item active text-white">
                Tutorial
            </li>
        </ol>
    </nav>

    <!-- Tutorial Header -->
    <div class="mb-4">
        <h2 class="fw-bold">Camera Basics: Understanding Exposure</h2>
        <p class="text-muted">Category: Camera Fundamentals</p>
    </div>

    <!-- Tutorial Image -->
    <div class="mb-4 text-center">
        <img src="https://via.placeholder.com/800x400"
             class="img-fluid rounded shadow"
             alt="Tutorial Image" />
    </div>

    <!-- Tutorial Content -->
    <div class="mb-5">
        <h4>Introduction</h4>
        <p>
            Exposure in photography is controlled by three main elements:
            aperture, shutter speed, and ISO. These three components work
            together to determine how bright or dark your image appears.
        </p>

        <h4>Aperture</h4>
        <p>
            Aperture controls how much light enters the camera lens.
            A lower f-number (e.g., f/1.8) allows more light in,
            while a higher f-number (e.g., f/16) reduces light.
        </p>

        <h4>Shutter Speed</h4>
        <p>
            Shutter speed determines how long the camera sensor
            is exposed to light. Faster speeds freeze motion,
            while slower speeds create motion blur.
        </p>

        <h4>ISO</h4>
        <p>
            ISO controls the camera’s sensitivity to light.
            Higher ISO values brighten images but may add noise.
        </p>
    </div>

    <!-- Video Section -->
    <div class="mb-5 text-center">
        <h4 class="mb-3">Watch Tutorial Video</h4>

        <div class="ratio ratio-16x9">
            <iframe src="https://www.youtube.com/embed/3e1uN9q8nWc"
                    title="Photography Tutorial"
                    allowfullscreen></iframe>
        </div>
    </div>

    <!-- Quiz Button -->
    <div class="text-center mb-5">
        <a href="TakeQuiz.aspx" class="btn btn-warning btn-lg">
            Take Self-Assessment Quiz
        </a>
    </div>

</asp:Content>