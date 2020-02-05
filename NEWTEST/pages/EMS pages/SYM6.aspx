<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SYM6.aspx.cs" Inherits="pages_EMS_pages_SYM6" %>

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
            <div class="auto-style6" style="padding: 5px 10px 5px 10px; margin: 10px; border-style: inset; border-width: thin; text-align: center; vertical-align: middle;">
                <b>After replacing a failed disk with a new disk, which shows the LED as either green or red, sysconfig -r output shows the drive as broken</b>
                <p style="text-align: left">
                    <b>Symptom :</b><br />
                    Replaced a failed disk with a new disk
                New disk LED is green.
            <b>sysconfig -r</b> output shows the drive as broken.
                Disk still reported as broken although it has been replaced.
                New disk LED is red.
                </p>
                <p style="text-align: left">
                    <b>Cause :</b><br />
                    The Fibre Channel loop is faulty.
                The disk label was marked broken.
                </p>
                <p style="text-align: left">
                    <b>Solution :</b><br />
                    Use one of the following three methods to solve this issue:<br />
                    Reset the disk label from BROKEN to SPARE:
                <ul style="text-align: left">
                    <b>Using Data ONTAP 8.0 7-Mode</b>
                    <br />
                    From the Data ONTAP prompt, complete the following steps:<br />
                    Confirm the disk (example 0a.108) that you want to work on.<br />
                    filer> sysconfig -r<br />
                    <li>Enter advanced mode.</li>
                    filer> priv set advanced<br />
                    <li>Change the disk label from BROKEN to SPARE.</li>
                    filer*> disk unfail<br />
                    <li>Exit advanced mode.</li>
                    filer*> priv set
                    <br />
                    <li>Confirm that the disk now shows as a spare disk</li>
                    filer> sysconfig -r
                </ul>
                    <ul style="text-align: left">
                        <b>Using Data ONTAP 8.x.x Cluster-Mode</b><br />
                        Filer::> Storage Disk show
                    <br />
                        Then, go to diag mode :<br />
                        Filer::> set diag<br />
                        Warning: These diagnostic commands are for use by NetApp personnel only.
                        Do you want to continue? {y|n}: yes<br />

                        Filer::*> storage disk modify -state ?<br />
                        <li>spare</li>
                        <li>broken</li>
                        <li>removed</li>
                        <li>unfail</li>
                        Filer::*> storage disk modify -state unfail -disk(disk_id)
                    <li>You can also try to replace the BROKEN disk with a new or known good disk.</li>
                    </ul>
                    <br />
                </p>
            </div>
        </div>
    </form>
</body>
</html>
