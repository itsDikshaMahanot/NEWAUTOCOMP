<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/MasterPage1.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="pages_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css">

    <style>
        a:hover {
            background-color: lightblue
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content2" class="row flex-xl-nowrap " style="padding-left: 2.5cm; padding-right: 1cm;" draggable="false">
        <div style="width: 75%;">
            <div class="row">
                <div class="col-xl-10 card shadow" style="margin-top: 0.5%">
                    <div class="p-3 mb-5 bg-white rounded" style="align-self: center;">
                        <div id="diskbtn" class="card-body w3-hover-shadow w3-center" style="align-self: center; float: left;">
                            <asp:ImageButton runat="server" AlternateText="Disk Issue" ImageUrl="~/Assests/HDD.jpg" ToolTip="Disk Issue" ImageAlign="AbsMiddle" PostBackUrl="~/pages/Newdashboard.aspx" Height="150px" CssClass="rounded-right" Width="100%"></asp:ImageButton>
                            <br />
                            <br />
                            <h5 class="card-title" style="letter-spacing: normal; font-size: large; color: #FF9933; text-transform: capitalize; text-align: center;">DISK ISSUES</h5>
                        </div>
                        &nbsp; &nbsp; &nbsp; 
                        <div id="psubtn" class="card-body w3-hover-shadow w3-center" style="align-self: center; float: right;">
                            <asp:ImageButton runat="server" AlternateText="PSU Issue" ImageUrl="~/Assests/PSU.jpg" ToolTip="Disk Issue" ImageAlign="AbsMiddle" PostBackUrl="~/pages/NewPSUdashboard.aspx" Height="100%" CssClass="rounded-right" Width="100%"></asp:ImageButton>
                            <br />
                            <br />
                            <h5 class="card-title" style="letter-spacing: normal; font-size: large; color: #FF9933; text-transform: capitalize; text-align: center;">PSU ISSUES</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="width: 30%;">
            <div class="row">
                <div class="col-xl-10 card shadow" style="margin-top: 2%">
                    <div class="p-3 mb-5 bg-white rounded" style="align-self: center;">
                        <div class="card-body mb-5" style="align-self: center; height: 50%">
                            <h5 class="card-title" style="letter-spacing: normal; font-size: large; color: #FF9933; text-transform: capitalize; text-align: center;">LINKS</h5>
                            <a href="https://mysupport.netapp.com/">My Support Page</a>
                            <br />
                            <a href="https://mysupport.netapp.com/site/downloads/firmware/disk-drive-firmware">Disk-Shelf-Firmware</a>
                            <br />
                            <a href="https://mysupport.netapp.com/site/downloads/firmware/disk-drive-firmware">Disk-Drive-Firmware</a>
                            <br />
                            <a href="https://mysupport.netapp.com/site/downloads/firmware/system-firmware-diagnostics">System-Firmware-Diagnostics</a>
                            <br />
                            <a href="https://mysupport.netapp.com/matrix/#welcome">Interoperability Matrix Tool  </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

