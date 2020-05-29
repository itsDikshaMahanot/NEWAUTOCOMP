<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/Basemaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel="stylesheet" href="../Assests/Loginsheet.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <style>
        .main {
            padding: 16px;
            margin-top: 50px;
            margin-bottom: 70px;
        }
    </style>

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper fadeInDown">
        <div id="formContent">
            <!-- Tabs Titles -->

            <!-- Icon -->
            <div class="fadeIn first">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTSXw4TlGV8mHx07W8QxsYVlFcR4Pau8iBhmrFUHwUu2PzFDpb2&usqp=CAU" id="icon" alt="User Icon" />
            </div>

            <!-- Login Form -->
            <form>
                <input type="text" id="uname" class="fadeIn second" name="username" autocomplete="off" placeholder="Username">
                <input type="password" id="pass" class="fadeIn third" name="password" placeholder="Password">
                <input type="submit" class="fadeIn fourth" value="Log In" runat="server" onserverclick="Loginbtn_Click">
            </form>

            <!-- Remind Passowrd -->
            <div id="formFooter">
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                <a class="underlineHover" href="#">Forgot Password?</a>
            </div>

        </div>
    </div>
</asp:Content>

