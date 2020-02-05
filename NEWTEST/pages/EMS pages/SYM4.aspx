<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SYM4.aspx.cs" Inherits="pages_EMS_pages_SYM4" %>

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
            <div  style="padding: 5px 10px 5px 10px; margin: 10px; border-style: inset; border-width: thin; text-align: center; vertical-align: middle;">
            <b>Disk shows up (Failed) in sysconfig -a but is present in sysconfig -r </b>
            <p style="text-align: left">
                <b>Cause :</b><br />
                A disk has encountered some problems and has been failed and later unfailed by owning filer after a reinsertion.
                The disk insertion does not recognize that the disk was previously failed and therefore does not send an unfail command to partner. The display of sysconfig -a continues to show the disk as failed on non-owner filer.
            </p>
            <p style="text-align: left">
                <b>Solution : </b>
                <br />
                <b>To synchronize the disk state between filers:</b><br />
                <ul style="text-align: left">
                    <li>If the disk is a spare, the disk state can be changed by removing the disk and then inserting it.
                    </li>
                    <li>If the disk is part of a volume, the disk can be removed via disk replace command;  on copy completion, remove the disk and then insert back into filer. 
                    </li>
                </ul>
            </p>
        </div>
        </div>
    </form>
</body>
</html>
