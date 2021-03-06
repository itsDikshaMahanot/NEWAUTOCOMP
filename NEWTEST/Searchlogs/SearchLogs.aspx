﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchLogs.aspx.cs" Inherits="Test_local" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-5" align="center" style="padding: 10px 20px 10px 20px; margin-top:2%">
                <table class="w3-card w3-padding-24" align="center" style="border-collapse: separate; border-spacing: 15px; width: 75%; height:100%;  font-family: 'Bodoni MT';">
                    <tr class="w3-center">
                        <td>
                            <input type="text" class="input-text autoclear" runat="server" id="serialnumber" placeholder="SerialNumber" style="width: 80%; padding: 3px 7px 3px 7px" />
                        </td>
                    </tr>
                    <tr class="w3-center">
                        <td>
                            <input id="partnerserialnumber" type="text" class="input-text autoclear" placeholder="Partner SerialNumber" runat="server" style="width: 80%; padding: 3px 7px 3px 7px" />
                        </td>
                    </tr>
                    <tr class="w3-center">
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="80%" ForeColor="Blue" EnableTheming="False" Font-Names="Bodoni MT" />
                        </td>
                    </tr>
                    <tr class="w3-center">
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Upload" Width="80%" OnClick="Upload" />
                        </td>
                    </tr>
                    <tr class="d-flex">
                        <td class="d-inline-flex p-3" colspan="3" rowspan="2">
                            <asp:Label ID="Label1" runat="server" Text="Upload status: "></asp:Label>
                            &nbsp &nbsp
                                <asp:Label ID="status" runat="server" ForeColor="Blue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20%">
                            <asp:Button ID="generate_Temp" runat="server" Text="Generate Template" Visible="true" CssClass="w3-center" Enabled="true" OnClick="generate_Temp_Click" data-toggle="modal" data-target="#myModal" Width="75%" />
                        </td>
                    </tr>
                </table>
            </div>

            <div class="col-xl-7" style="padding: 10px 20px 10px 20px; margin-top: 2%;">
                <div class="col  py-2" style="height: 100%; overflow: auto; left: 0px; top: 0px;">
                  
                    <table class="p-3 mb-5 bg-white rounded w-auto" style="width: 60%">
                        <tr>
                            <td style="padding-left: 1%" colspan="1">
                                <asp:Label ID="sysconfigA_Result" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Small" Width="130%" Visible="False" Text="RESULT SYSCONFIG -A :" Height="90%"></asp:Label>
                                <asp:Label ID="sysconfigR_Result" runat="server" ForeColor="#0066ff" Font-Bold="True" Font-Size="Small" Width="150%" Visible="False" Text="Result:" Height="90%"></asp:Label>
                                <asp:Label ID="template" runat="server" ForeColor="#3366FF" Visible="False" Text=" Need to replace the below given Disk: <br/>" Width="130%"></asp:Label>
                                
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
