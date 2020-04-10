<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Nextpage.aspx.cs" Inherits="pages_Nextpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel="stylesheet" href="style.css">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-group">
            <div align="center">
                <asp:Label ID="Label2" runat="server" Text="Current Case related"></asp:Label>
                <br />
                <br />
                <table class="w3-centered w3-card-2"  padding: 10px 20px 10px 20px; align-content: center">
                    <tr>
                        <td class="auto-style1" colspan="3">
                            <br />
                            <asp:TextBox ID="serialnumber" class="form-control" placeholder="SerialNumber" runat="server" CssClass="w3-padding-small" Width="280px" AutoCompleteType="Disabled" Text="721908000327"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="3">
                            <asp:TextBox ID="partnerserialnumber" class="form-control" placeholder="PartnerSerialNumber" runat="server" CssClass="w3-padding-small" Width="280px" AutoCompleteType="Disabled" Text="721908000328"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="3">&nbsp;</td>
                        <asp:Label ID="Label4" runat="server" Text="Choose File"></asp:Label>
                    </tr>
                    <tr>
                        <td class="d-inline-flex p-3" colspan="3">
                            <asp:FileUpload ID="FileUpload1" runat="server" ForeColor="Red" />
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td class="align-content-center" rowspan="1">
                            <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="fileUpload_Click"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="d-inline-flex p-2" colspan="3">
                            <asp:Label ID="StatusLabel" runat="server" Text="Upload status:"></asp:Label>
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td class="d-inline-flex p-2" colspan="3" rowspan="2">&nbsp
                           <asp:DropDownList ID="commands" placeholder="Commands" runat="server" Height="20pt" CausesValidation="True">
                               <asp:ListItem Selected="True" Text="Select"></asp:ListItem>
                               <asp:ListItem Text="sysconfig -a" Enabled="True" Value="sysconfig -a"> sysconfig -a</asp:ListItem>
                               <asp:ListItem Text=" sysconfig -r" Enabled="True" Value="sysconfig -r">sysconfig -r</asp:ListItem>
                           </asp:DropDownList>&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter the DISK Address." AutoCompleteType="Disabled"></asp:TextBox>
                        </td>
                       </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="3">
                            <asp:Button ID="search" runat="server" Text=" SEARCH" align="center" CssClass="w3-button w3-light-green w3-round-large" Width="140px" Style="margin-top: 3%; margin-left: 70px; margin-right: 60px;" ToolTip="search for Duplicate Cases" />
                        </td>
                    </tr>
               </table>
            </div>
        </div><br /><hr />
        <div align="center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="True" />
                    <asp:BoundField DataField="Content_Type" HeaderText="Content_Type" ReadOnly="True" SortExpression="Content_Type" />
                    <asp:BoundField DataField="size" HeaderText="Size" ReadOnly="True" SortExpression="size" DataFormatString="{0:#,### kb}" NullDisplayText="null" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
