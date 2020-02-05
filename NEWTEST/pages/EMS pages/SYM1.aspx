<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SYM1.aspx.cs" Inherits="pages_EMS_pages_SYM1" %>

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
             <div >
        <div  style="padding: 5px 10px 5px 10px; margin: 10px; border-style: inset; border-width: thin; text-align: center; vertical-align: middle;">
            <b>Performance degradation due to misbehaving disk</b>
            <p style="text-align: left">
                <b>Cause :</b><br />
                <b>The following messages are logged in EMS log:</b><br />
                Fri Oct 14 09:02:18 CEST [netapp01: disk_latency_monito: shm.threshold.ioLatency:debug]: Disk MC1-B-SW4:2.17 has exceeded the expected IO latency in the current window with average latency of 52 msecs and average utilization of 79 percent. Highest average IO latency: MC1-B-SW4:2.17: 52 msecs; next highest IO latency: MC1-B-SW4:19.126L35: 17 msecs 
                <br />
                Fri Oct 14 09:05:18 CEST [netapp01: isp2400_intrd: scsi.cmd.retrySuccess:info]: Disk device MC1-B-SW4:2.17: request successful after retry #1/#0: cdb 0x2a:1a6340d8:0060 (811).
                <br />
                Fri Oct 14 09:11:39 CEST [netapp01: isp2400_intrd: scsi.cmd.checkCondition:error]: Disk device MC1-B-SW4:2.17: Check Condition: CDB 0x2a:010d3718:0068: Sense Data SCSI:aborted command - (0xb - 0x44 0x0 0x5c)(465)
            </p>
          
            <p style="text-align: left">
                <b>Solution :</b><br />
                <ul style="text-align: left">
                    <li>Pre-failed disk DISK_NAME to copy over the data to a spare drive.</li>
                    <br />
                    <li>Replace the disk.</li>
                    <br />
                    <li>Upgrade your Data ONTAP to the latest available release.</li>
                    <br />
                    <li>The disk error recovery and disk failure mechanism are significantly improved.</li>
                </ul>
            </p>
            <p style="color: #0000FF">
                <a href="https://mysupport.netapp.com/NOW/cgi-bin/software/" class="w3-hover w3-hover-pale-blue">CLICK TO UPGRADE THE ONTAP DATA TO IT'S LATEST VERSION</a>
            </p>           
            
        </div>
        <br />
        <br />
    </div>
        </div>
    </form>
</body>
</html>
