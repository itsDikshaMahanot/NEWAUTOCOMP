<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search_sysconfigout.aspx.cs" Inherits="Test_Search_sysconfigout" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

</head>
<body>
    <form id="form1" runat="server" font-names="Bodoni MT">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5" align="center" style="padding: 10px 20px 10px 20px">
                    <asp:Label ID="Label3" runat="server" Text="UPLOAD AND SEARCH"></asp:Label>
                    <br />
                    <br />
                    <table class="w3-card w3-padding-24" align="center" style="border-collapse: separate; border-spacing: 15px; width: 70%; font-family: 'Bodoni MT';">
                        <tr class="w3-center">
                            <td>
                                <input type="text" class="input-text autoclear" runat="server" id="serialnumber" placeholder="SerialNumber" style="width: 80%; padding: 3px 7px 3px 7px" />
                            </td>
                        </tr>
                        <tr class="w3-center">
                            <td>
                                <input id="partnerserialnumber" type="text" class="input-text autoclear" placeholder="Partner SerialNumber" runat="server" style="width: 80%; padding: 3px 7px 3px 7px" />
                            </td>
                        </tr>
                        <tr class="w3-center">
                            <td>
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="75%" ForeColor="Blue" EnableTheming="False" Font-Names="Bodoni MT" />
                            </td>
                        </tr>
                        <tr class="w3-center">
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Upload" Width="75%" OnClick="Upload" />
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <td class="d-inline-flex p-3" colspan="3" rowspan="2">
                                <asp:Label ID="Label1" runat="server" Text="Upload status: "></asp:Label>
                                &nbsp &nbsp
                                <asp:Label ID="status" runat="server" ForeColor="Blue"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <hr />
                    <table class="w3-card w3-padding-24" align="center" style="border-collapse: separate; border-spacing: 20px; width: 70%; font-family: 'Bodoni MT';">
                        <tr class="w3-center">
                            <td>
                                <input type="text" class="input-text autoclear" placeholder="Serial Number" runat="server" id="Text2" style="width: 85%; padding: 3px 7px 3px 7px" autocomplete="off" value="850000217840" />
                            </td>
                            <td>
                                <asp:Button ID="srchFile" runat="server" Text=" File Search" Width="90%" OnClick="search_File" />
                            </td>
                        </tr>
                        <tr class="w3-center">
                            <td style="padding-left: 15px; padding-right: 10px">
                                <asp:Button ID="sysconfigA" runat="server" Text="SYSCONFIG -A" Width="98%" CssClass="w3-left" OnClick="sysconfigA_Click" />
                            </td>
                            <td style="padding-left: 10px; padding-right: 20px">
                                <asp:Button ID="sysconfigR" runat="server" Text="SYSCONFIG -R" Width="108%" CssClass="w3-left" OnClick="sysconfigR_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 28%">
                                <asp:Button ID="generate_Temp" runat="server" Text="Generate Template" Visible="true" CssClass="w3-center" Enabled="False" OnClick="generate_Temp_Click" data-toggle="modal" data-target="#myModal" />
                            </td>
                        </tr>
                    </table>

                </div>
                <div class="col-xl-7" style="padding: 10px 20px 10px 20px; margin-top: 2%;">
                    <div class="col  py-2" style="height: 100%; overflow: auto; left: 0px; top: 0px;">
                        <asp:GridView ID="GridView1" runat="server" CellPadding="5" CellSpacing="12" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" AllowSorting="True" Height="50%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ButtonType="Button" CancelText="" DeleteText="" EditText="" HeaderText="Choose" InsertText="" NewText="" ShowSelectButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True">
                                    <FooterStyle Wrap="False" />
                                    <HeaderStyle Width="40px" Wrap="False" />
                                    <ItemStyle Width="20px" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="serialno" HeaderText="Serial Number" ReadOnly="True">
                                    <FooterStyle Wrap="False" />
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="True" />
                                <asp:BoundField DataField="Content_Type" HeaderText="Content_Type" ReadOnly="True" />
                                <asp:BoundField DataField="size" HeaderText="Size" ReadOnly="True" DataFormatString="{0:#,### kb}" NullDisplayText="null">
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
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
                        <table class=" w-auto">
                            <tr>
                                <td colspan="1">
                                    <asp:Label ID="sysconfigA_Result" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Small" Width="110%" Visible="False" Text="RESULT SYSCONFIG -A :" Height="90%"></asp:Label>
                                    <asp:Label ID="sysconfigR_Result" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Small" Width="110%" Visible="False" Text="RESULT SYSCONFIG -R:" Height="90%"></asp:Label>
                                    <asp:Label CssClass="w3-card-2" ID="template" runat="server" ForeColor="#3366FF" Visible="False" Text=" Need to replace the below given Disk: <br/>"></asp:Label>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
