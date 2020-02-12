<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EMS.aspx.cs" Inherits="pages_EMS" %>

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
             <div style="margin-left:20px; float:left" >
        <asp:Image ID="Image1" runat="server"  ImageUrl="~/assests/netapp.png" Width="80" Height="76"  BorderStyle="Groove" />
        <br />
        <br />
        <div >
            <p>
                [?] Sat Feb 01 09:58:57 HKT [hk-cdot1-02: config_thread: raid.config.filesystem.disk.failed:error]: File system Disk /aggr0_hk_cdot_02_0/plex0/rg0/0a.11.0 Shelf 11 Bay 0 [NETAPP   X477_SMEGX04TA07 NA03] S/N [Z1ZB3WF5] failed.
            </p>
           <%-- <ul type="square">--%>
                <%--<li>
                    <a href="EMS pages/SYM1.aspx" class=" a w3-hover-pale-blue">Performance degradation due to misbehaving disk</a>
                </li><br />
                <li>
                    <a href="EMS pages/SYM2.aspx" class=" a w3-hover-pale-blue" >Failed disk check for disk reassign</a>
                </li><br />
                <li>
                    <a href="EMS pages/SYM3.aspx" class=" a w3-hover-pale-blue" >Single failed disk causing failed disk callhome on both HA nodes</a>
                </li><br />
                <li>
                    <a href="EMS pages/SYM4.aspx" class="a w3-hover-pale-blue">Disk shows up Failed in sysconfig -a but is present in sysconfig -r</a>
                </li><br />
                <li>
                    <a href="EMS pages/SYM5.aspx" class="a w3-hover-pale-blue">Disk Reconstruction Failed</a>
                </li><br />
                <li>
                  <a href="EMS pages/SYM6.aspx" class="a w3-hover-pale-blue"> After replacing a failed disk with a new disk, which shows the LED as either green or red, sysconfig -r output shows the drive as broken</a>
                </li><br />
                <li>
                    <a href="EMS pages/SYM7.aspx" class="a w3-hover-pale-blue">Giveback failure due to disk check</a>
                </li><br />
                <li>
                    <a href="EMS pages/SYM8.aspx" class="a w3-hover-pale-blue">Device Qualification Failed Critical</a>
                </li><br />--%>
            </ul>

        </div>
    </div>
        </div>
    </form>
</body>
</html>
