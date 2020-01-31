<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logs.aspx.cs" Inherits="pages_Logs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <style>
        fieldset {
            border: 5px solid #ddd !important;
            padding: 2%;
            position: relative;
            border-radius: 10px;
            width: 68%;
            margin-left: 50px;
            height: 100px;
            text-align: center;
            margin-top: 10%;
        }

        }

        legend {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 50px;
            width: 5%;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #ffffff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div align="center">
                <fieldset>
                    <legend>LOGS </legend>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <asp:LinkButton ID="btnEMS" class="w3-button w3-hover-blue w3-round-large" runat="server" ToolTip="To check EMS Error MSG">EMS</asp:LinkButton>
                            <asp:LinkButton ID="btnenvironment" class="w3-button w3-hover-blue w3-round-large" runat="server" ToolTip="To check Variables in Environment ">ENVIRONMENT</asp:LinkButton>
                            <asp:LinkButton ID="btnsysconfiga" class="w3-button w3-hover-blue w3-round-large" runat="server" ToolTip="To check the all Disk Information">SYSCONFIG-A</asp:LinkButton>
                            <asp:LinkButton ID="btnsysconfigr" class="w3-button w3-hover-blue w3-round-large" runat="server" ToolTip="To find the Disk in which AGGR">SYSCONFIG-R</asp:LinkButton>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>

    </form>
</body>
</html>
