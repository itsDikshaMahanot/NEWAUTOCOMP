<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="pages_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server" font-names="Bodoni MT">
        <div>
            <div align="center" style="padding: 10px 20px 10px 20px">
                <table class="w3-card w3-padding-24" align="center" style="border-style: outset; border-width: medium; border-collapse: separate; border-spacing: 15px; width: 20%; font-family: 'Bodoni MT';">
                    <tr class="w3-center">
                        <td>
                            <input id="serialnumber" type="text" style="width: 80%" />
                        </td>
                    </tr>
                    <tr class="w3-center">
                        <td>
                            <input id="partnerserialnumber" type="text" style="width: 80%" />
                        </td>
                    </tr>
                    <tr class="w3-center">
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="75%" ForeColor="Blue" EnableTheming="False" Font-Names="Bodoni MT" />
                    </tr>
                    <tr class="w3-center">
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" Width="75%" />
                        </td>
                    </tr>
                    <tr class="d-flex">
                        <td class="d-inline-flex p-3" colspan="3" rowspan="2">
                            <asp:Label ID="Label1" runat="server" Text="Upload status:"></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text="aa" ForeColor="Blue"></asp:Label>
                        </td>
                    </tr>
                    <tr class="w3-center">
                        <td class="d-inline-flex p-2" colspan="3" rowspan="2">&nbsp
                                 <asp:DropDownList ID="commands" placeholder="Commands" runat="server" Height="23pt" Width="150pt" CausesValidation="True">
                                     <asp:ListItem Selected="True" Text="Select"></asp:ListItem>
                                     <asp:ListItem Text="sysconfig -a" Enabled="True" Value="sysconfig -a"> sysconfig -a</asp:ListItem>
                                     <asp:ListItem Text=" sysconfig -r" Enabled="True" Value="sysconfig -r">sysconfig -r</asp:ListItem>
                                 </asp:DropDownList>&nbsp;&nbsp;
                        </td>
                        <tr class="w3-center">
                            <td>
                                <input id="Text1" type="text" style="width:75%"/>
                            </td>
                        </tr>
                    </tr>
                    <tr class="w3-center">
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Search" Width="75%" />
                        </td>
                    </tr>
                </table>

            </div>

        </div>


        <hr />
        <%-- <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                </asp:GridView>--%>
    </form>


</body>
</html>
