<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WAPP_Assignment.About" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-5">

        <!-- HERO TITLE -->

        <div class="text-center mb-5 reveal">
            <h1 class="text-warning">About SmartClicks</h1>

            <p class="lead mt-3">
                A modern learning platform designed to help aspiring photographers and videographers
                master creative skills through structured tutorials and interactive quizzes.
            </p>
        </div>



        <!-- IMAGE + MISSION -->

        <div class="row align-items-center mb-5 reveal">

            <div class="col-md-6">
                <img src="Images/about-photography.jpg"
                    class="img-fluid rounded shadow">
            </div>

            <div class="col-md-6">

                <h2 class="text-warning">Our Mission</h2>

                <p class="mt-3">
                    SmartClicks was created to provide a structured and engaging way for beginners
                    to learn photography and videography skills without feeling overwhelmed.
                </p>

                <p>
                    Instead of random tutorials scattered across the internet, our platform
                    organises learning into clear categories, tutorials, and quizzes so users
                    can build skills step-by-step.
                </p>

            </div>

        </div>



        <!-- WHAT WE OFFER -->

        <section class="mb-5 reveal">

            <h2 class="text-warning text-center mb-4">What We Offer
            </h2>

            <div class="row">

                <div class="col-md-4 mb-4">

                    <div class="card bg-dark text-white shadow-lg p-4 h-100">

                        <h4>📸 Photography Tutorials</h4>

                        <p class="mt-2">
                            Step-by-step tutorials covering landscape, portrait,
                        street photography and more.
                        </p>

                    </div>

                </div>



                <div class="col-md-4 mb-4">

                    <div class="card bg-dark text-white shadow-lg p-4 h-100">

                        <h4>🎥 Videography Learning</h4>

                        <p class="mt-2">
                            Understand camera movement, framing,
                            audio setup and cinematic storytelling.
                        </p>

                    </div>

                </div>



                <div class="col-md-4 mb-4">

                    <div class="card bg-dark text-white shadow-lg p-4 h-100">

                        <h4>📝 Interactive Quizzes</h4>

                        <p class="mt-2">
                            Test your knowledge with self-assessment quizzes
                            and track your learning progress.
                        </p>

                    </div>

                </div>

            </div>

        </section>



        <!-- WHO THIS IS FOR -->

        <section class="mb-5 reveal">

            <h2 class="text-warning text-center mb-4">Who Is SmartClicks For?
            </h2>

            <div class="row text-center">

                <div class="col-md-4">

                    <h4>🎓 Beginners</h4>

                    <p>
                        People who want to learn photography from the basics
                        without feeling overwhelmed.
                    </p>

                </div>

                <div class="col-md-4">

                    <h4>📷 Hobbyists</h4>

                    <p>
                        Photography enthusiasts who want to improve their
                        creative skills and technical understanding.
                    </p>

                </div>

                <div class="col-md-4">

                    <h4>🎬 Content Creators</h4>

                    <p>
                        Creators who want to learn better filming,
                        composition and editing techniques.
                    </p>

                </div>

            </div>

        </section>



        <!-- CALL TO ACTION -->

        <div class="text-center mb-5 reveal">

            <h2 class="text-warning">Start Learning With SmartClicks
            </h2>

            <p class="mt-3">
                Join our platform and begin your photography journey today.
            </p>

            <a href="Register.aspx" class="btn btn-warning btn-lg mt-3">Create Free Account
            </a>

        </div>

    </div>

</asp:Content>