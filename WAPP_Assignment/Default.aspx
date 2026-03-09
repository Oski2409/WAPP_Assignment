<%@ Page Title="Home"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="WAPP_Assignment._Default" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <!-- HERO SECTION -->

    <section class="hero-section text-center text-white">

        <div class="container">

            <h1 class="display-4 fw-bold">Master Photography Skills
            </h1>

            <p class="lead mt-3">
                Learn lighting, composition, camera settings and creative techniques
                through structured tutorials and interactive quizzes.
            </p>

            <div class="mt-4">

                <a href="Tutorials.aspx" class="btn btn-warning btn-lg me-3">Start Learning
                </a>

                <a href="Register.aspx" class="btn btn-outline-light btn-lg">Join Now
                </a>

            </div>

        </div>

    </section>



    <!-- PLATFORM INTRODUCTION -->

    <section class="container mt-5 reveal">

        <div class="row align-items-center">

            <div class="col-md-6">

                <img src="Images/learning-photography.jpeg"
                    class="img-fluid rounded shadow">
            </div>

            <div class="col-md-6">

                <h2 class="text-warning">Learn Photography the Right Way
                </h2>

                <p class="mt-3">
                    SmartClicks is designed for beginners and aspiring photographers who
                    want structured learning instead of random tutorials.
                </p>

                <p>
                    Our platform combines tutorials, video guides and quizzes to help you
                    learn faster and retain knowledge through practice.
                </p>

                <a href="Tutorials.aspx" class="btn btn-warning mt-3">Explore Tutorials
                </a>

            </div>

        </div>

    </section>



    <!-- WHY SMARTCLICKS -->

    <section class="container mt-5 text-center reveal">

        <h2 class="text-warning mb-5">Why Learn With SmartClicks
        </h2>

        <div class="row">

            <div class="col-md-4">

                <h4>📚 Structured Tutorials</h4>

                <p>
                    Step-by-step lessons organised into categories so you always know
                    what to learn next.
                </p>

            </div>

            <div class="col-md-4">

                <h4>🎥 Video Guides</h4>

                <p>
                    Visual demonstrations make complex photography techniques easier
                    to understand.
                </p>

            </div>

            <div class="col-md-4">

                <h4>📝 Self-Assessment</h4>

                <p>
                    Test your knowledge with quizzes and track your learning progress.
                </p>

            </div>

        </div>

    </section>



    <!-- POPULAR CATEGORIES -->

    <section class="container mt-5 reveal">

        <h2 class="text-warning text-center mb-5">Popular Learning Categories
        </h2>

        <div class="row">

            <!-- Landscape -->

            <div class="col-md-4 mb-4">

                <div class="card bg-dark text-white shadow">

                    <img src="Images/landscape.jpg"
                        class="card-img-top">

                    <div class="card-body">

                        <h5 class="card-title">Landscape Photography
                        </h5>

                        <p class="card-text">
                            Learn composition techniques to capture stunning nature photos.
                        </p>

                    </div>

                </div>

            </div>



            <!-- Portrait -->

            <div class="col-md-4 mb-4">

                <div class="card bg-dark text-white shadow">

                    <img src="Images/portrait.jpg"
                        class="card-img-top">

                    <div class="card-body">

                        <h5 class="card-title">Portrait Photography
                        </h5>

                        <p class="card-text">
                            Master lighting and posing techniques for professional portraits.
                        </p>

                    </div>

                </div>

            </div>



            <!-- Videography -->

            <div class="col-md-4 mb-4">

                <div class="card bg-dark text-white shadow">

                    <img src="Images/videography.jpg"
                        class="card-img-top">

                    <div class="card-body">

                        <h5 class="card-title">Videography
                        </h5>

                        <p class="card-text">
                            Learn camera movement, framing and cinematic storytelling.
                        </p>

                    </div>

                </div>

            </div>

        </div>

    </section>



    <!-- FINAL CALL TO ACTION -->

    <section class="container text-center mt-5 mb-5 reveal">

        <h2 class="text-warning">Start Your Photography Journey Today
        </h2>

        <p class="mt-3">
            Create a free account and begin learning photography skills
            with structured tutorials and quizzes.
        </p>

        <a href="Register.aspx"
            class="btn btn-warning btn-lg mt-3">Create Free Account
        </a>

    </section>

</asp:Content>