<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/MasterPage1.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="pages_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css">

    <script>
        $(document).ready(function () {
            $("a").click(function (e) {
                e.preventDefault();
                $("a").removeClass("active");
                $(this).addClass("active");
                $("#myFrame").attr("src", $(this).attr("href"));
            })
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row flex-xl-nowrap " style="padding-left: 0.5cm; padding-right: 0.5cm;">
        <div class="col-2 col-md-3 col-xl-2 col-xs-4 sidenav">
            <nav class="bd-links">

                <i class="fas fa-search" aria-hidden="true"></i>
                <input class="form-control " style="margin-bottom: 1rem;" type="text" placeholder="Search Kb Symptom" aria-label="Search">
                <h4>Issues List</h4>
                <ul class="nav nav-pills flex-column">
                    
                    <li class="nav-item">
                        <a class="nav-link " href="Disk.aspx">Disk Issue</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="PSU.aspx" target="myFrame">PSU</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">PSU</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Disabled</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Disabled</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Disabled</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Disabled</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Disabled</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Disabled</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Last 5</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Last 4</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Last 3</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Last 2</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Last 1</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Last</a>
                    </li>
                </ul>
                <hr class="d-sm-none">
            </nav>
        </div>
        <div class="col-12 col-md-9 col-xl-8 py-md-3 pl-md-5 bd-content main col-xs-8">

            <iframe  name="myFrame" id="myFrame" style="height: 360%; width: 100%; border: none; background-color: #ffffff;"></iframe>
        </div>
    </div>


</asp:Content>

