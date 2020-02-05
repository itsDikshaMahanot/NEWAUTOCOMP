<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SYM2.aspx.cs" Inherits="pages_EMS_pages_SYM2" %>

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
                <b>Failed disk check for disk reassign</b>
                <p style="text-align: left">
                    <b>Cause :</b><br />
                    During disk reassign, if there are failed disks, the are chances that the node
                 panics. 
                <br />
                    This issue happens in Data Ontap 8.0 and earlier releases. 
                </p>

                <p style="text-align: left">
                    <b>Solution : </b>
                    <br />
                    If you are on Data Ontap 8.0 releases the workaround is to run disk show command
                to identify the failed disks and pull them out before doing reassignment of disks.
                </p>

                <p style="text-align: left">
                    <b>Commands to identify failed disk in the system :</b><br />
                    <b>For 7-mode :</b>
                    disk show -v 
                <br />
                    <b>For C-mode :</b>
                    storage disk show 
                </p>
            </div>
        </div>
    </form>
</body>
</html>
