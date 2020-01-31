<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Disksearch.aspx.cs" Inherits="pages_Disksearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="padding-top: 10px; margin-left:25%" >
                <asp:Label ID="Label1" runat="server" Text="DUPLICATE CASE INFORMATION !!"></asp:Label>
        <br />
        <br />
    </div>
    <br />
    <br />
    <div class="container w3-center">
        <asp:table id="Table1"
            runat="server"
            borderstyle="Double"
            borderwidth="5px"
            height="381px"
            cssclass=" w3-table"
            style="margin-left: 170px"
            cellpadding="5"
            cellspacing="5"
            width="500px"
            backcolor="LightCyan">
            <asp:TableRow runat="server" Height="1px" Width="1px" >
                <asp:TableCell runat="server" Height="2px" Width="2px">Case number</asp:TableCell>
                <asp:TableCell runat="server" Height="2px" Width="2px">Status</asp:TableCell>
                <asp:TableCell runat="server" Height="2px" Width="2px">Link </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" Height="1px" Width="1px" >
                <asp:TableCell runat="server" Height="5px" Width="5px">2008152639</asp:TableCell>
                <asp:TableCell runat="server" Height="5px" Width="5px">closed</asp:TableCell>
                <asp:TableCell runat="server" Height="5px" Width="5px" > <a href="https://smartsolvecm.netapp.com/"> https://smartsolvecm.netapp.com/</a></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" Height="1px" Width="1px" >
                <asp:TableCell runat="server" Height="5px" Width="5px">2008135833</asp:TableCell>
                <asp:TableCell runat="server" Height="5px" Width="5px">open</asp:TableCell>
                <asp:TableCell runat="server" Height="5px" Width="5px"><a href="https://smartsolvecm.netapp.com/"> https://smartsolvecm.netapp.com/</a></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" Height="1px" Width="1px" >
                <asp:TableCell runat="server" Height="5px" Width="5px">2008135833</asp:TableCell>
                <asp:TableCell runat="server" Height="5px" Width="5px">open</asp:TableCell>
                <asp:TableCell runat="server" Height="5px" Width="5px"><a href="https://smartsolvecm.netapp.com/"> https://smartsolvecm.netapp.com/</a></asp:TableCell>
            </asp:TableRow>
        </asp:table>
        <br />
        <div align="center">
            <asp:button id="chcekASUP" runat="server" text=" Check ASUP" Style="margin-right: 150px;margin-left: 0px;" CssClass="w3-light-blue w3-centered" width="140px" OnClick="chcekASUP_Click" ToolTip="Click to check ASUP" />
        </div>
    </div>
        </div>
    </form>
</body>
</html>
