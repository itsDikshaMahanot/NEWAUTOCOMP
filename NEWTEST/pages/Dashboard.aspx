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

    <style>
        .button {
            padding: 15px 25px;
            font-size: 24px;
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
            margin-top: 100px;
        }

        .auto-style1 {
            position: relative;
            width: 100%;
            -ms-flex: 0 0 8.333333%;
            flex: 0 0 8.333333%;
            max-width: 8.333333%;
            left: 0px;
            top: 0px;
            padding-left: 10px;
            padding-right: 10px;
        }
    </style>

    <script>  //code for src to come in iframe 
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
    <div class="row flex-xl-nowrap " style="padding-left: 0.3cm; padding-right: 0.3cm;" draggable="false">
        <div style="color: blue; padding: 2%">
        </div>

        <div style="width: 70%;">
            <div class="row">
                <div class="col-sm-4">
                    <div class="card shadow p-3 mb-5 bg-white rounded" style="align-self: center;">
                        <div class="card-body" style="align-self: center;">
                            <asp:ImageButton runat="server" AlternateText="Disk Issue" ForeColor="#FF9933" ImageUrl="~/Assests/diskissues.png" ToolTip="Disk Issue" BackColor="Black" BorderStyle="Solid" ImageAlign="AbsMiddle" PostBackUrl="~/pages/Newdashboard.aspx" Height="150px" CssClass="rounded-right"></asp:ImageButton>
                            <br />
                            <br />
                            <h5 class="card-title" style="letter-spacing: normal; font-size: large; color: #FF9933; text-transform: capitalize; text-align: center;">DISK ISSUES</h5>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                     <div class="card shadow p-3 mb-5 bg-white rounded" style="align-self: center;">
                        <div class="card-body" style="align-self: center;">
                            <asp:ImageButton runat="server" AlternateText="Disk Issue" ForeColor="#FF9933" ImageUrl="~/Assests/psuissue.png" ToolTip="Disk Issue" BackColor="Black" BorderStyle="Solid" ImageAlign="AbsMiddle" PostBackUrl="~/pages/NewPSUdashboard.aspx" Height="150px" CssClass="rounded-right"></asp:ImageButton>
                            <br />
                            <br />
                            <h5 class="card-title" style="letter-spacing: normal; font-size: large; color: #FF9933; text-transform: capitalize; text-align: center;">PSU ISSUES</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <%-- <div class="col-xl-2 col-lg-8 col-md-12" style="color: blue; width:60%; padding:5%; text-align: center;" >
            <asp:Button ID="Button1" class="button" runat="server" Text="DISK ISSUE" OnClick="Button1_Click" />
            <asp:imagebutton runat="server" AlternateText="Disk Issue" ForeColor="#FF9933"  ImageUrl="~/Assests/diskissues.png" OnClick="Disk_Click" ToolTip="Disk Issue" BackColor="Black" BorderStyle="Solid" Height="50%" ImageAlign="Middle"></asp:imagebutton>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Disk Issue" Font-Bold="True" Font-Size="16pt"></asp:Label>
        </div>
        <div class="col-xs-4 col-md-4" style="color: blue; padding-top:5%">
          <asp:imagebutton runat="server" AlternateText="Psu Issue" ForeColor="#FF9933"  ImageUrl="~/Assests/psuissue.png" OnClick="Button2_Click" ToolTip="Psu Issue" BackColor="Black" BorderStyle="Solid" Height="50%" ImageAlign="Middle"></asp:imagebutton>
         
           
        </div>--%>
    </div>


</asp:Content>

