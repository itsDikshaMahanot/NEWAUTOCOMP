<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SYM3.aspx.cs" Inherits="pages_EMS_pages_SYM3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div style="padding: 5px 10px 5px 10px; margin: 10px; border-style: inset; border-width: thin; text-align: center; vertical-align: middle;">
                <b>Single failed disk causing failed disk callhome on both HA nodes</b>
                <p style="text-align: left">
                    <b>Cause :</b><br />
                    When a shared disk fails, an AutoSupport message is sent from both nodes of an HA pair. 
                </p>
                <p style="text-align: left">
                    <b>Solution : </b>
                    <br />
                    <a href="https://mysupport.netapp.com/NOW/cgi-bin/bol?Type=Detail&Display=1169260" style="color: #0000FF">A Fixed Bug 1169260 </a>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
