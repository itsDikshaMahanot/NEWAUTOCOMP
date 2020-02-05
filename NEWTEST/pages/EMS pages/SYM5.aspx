<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SYM5.aspx.cs" Inherits="pages_EMS_pages_SYM5" %>

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
            <b>DISK RECONSTRUCTION FAILED </b>
            <p style="text-align: left">
                <b>Symptom :</b><br />
                Multiple reconstructions are occurring on the NetApp storage system.
                In the case of a DISK RECONSTRUCTION FAILED error, you might also see one or more of the following AutoSupport (ASUP) errors:<br />
                <ul style="text-align: left">
                    <li>DISK MISSING<br />
                    </li>
                    <li>FILESYSTEM DISK MISSING<br />
                    </li>
                    <li>FILESYSTEM DISK NOT RESPONDING<br />
                    </li>
                    <li>SPARE DISK MISSING<br />
                    </li>
                    <li>SPARES_LOW<br />
                    </li>
                    <li>SPARE DISK NOT RESPONDING<br />
                    </li>
                    <li>MULTIPLE DISKS MISSING<br />
                    </li>
                    <li>ENCLOSURE SERVICES ACCESS ERROR<br />
                    </li>

                </ul>

            </p>
            <p style="text-align: left">
                <b>Solution : </b>
                <br />
                Although there may be multiple reasons for a disk to fail during reconstruct, the most common reason is outdated disk or shelf firmware.
                1. Check your installed disk drive firmware and upgrade, if necessary. Upgrading to the current version resolves most problems.<br />
                <br />
            </p>
            <a href="https://mysupport.netapp.co
        </div>
    </form>
</body>
</html>
