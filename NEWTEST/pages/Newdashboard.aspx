<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/MasterPage1.master" AutoEventWireup="true" CodeFile="Newdashboard.aspx.cs" Inherits="pages_Newdashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//cloud.typography.com/6091132/651206/css/fonts.css">
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
    <style>
        .button {
            padding: 15px 25px;
            font-size: 34px;
            text-align: center;
            cursor: pointer;
            outline: none;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 15px;
            box-shadow: 0 9px #999;
            /*margin-left:400px;
            margin-top:50px;*/
        }

            .button:hover {
                background-color: #3e8e41
            }

            .button:active {
                background-color: #3e8e41;
                box-shadow: 0 5px #666;
                transform: translateY(4px);
            }

        #Second {
            margin-top: 50px;
        }
    </style>



   <%-- <script type="application/javascript">

        function resizeIFrameToFitContent( myframe ) {

    iFrame.width  = iFrame.contentWindow.document.body.scrollWidth;
    iFrame.height = iFrame.contentWindow.document.body.scrollHeight;
        }

    window.addEventListener('DOMContentLoaded', function(e) {

    var iFrame = document.getElementById( 'myframe' );
    resizeIFrameToFitContent( iFrame );

    // or, to resize all iframes:
      var iframes = document.querySelectorAll("myframe");
         for( var i = 0; i < iframes.length; i++) {
           resizeIFrameToFitContent( iframes[i] );
     }
    } );
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row flex-xl-nowrap " style="padding-left: 0.5cm; padding-right: 0.5cm;">
        <div id="Second" class="row col-xl-12">
            <iframe name="myFrame" src="Disk.aspx" id="myFrame" scrolling="no" style=border: none;  background-color: #ffffff;" height="350%" width="250%"></iframe>
        </div>
    </div>
</asp:Content>
