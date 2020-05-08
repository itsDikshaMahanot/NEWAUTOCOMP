<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Disk.aspx.cs" Inherits="pages_Disk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div align="center" style="margin-top:6%">
                <table class="w3-centered auto-style2 w3-card-2" style="border: thin outset #000000; padding: 10px 20px 10px 20px; align-content: center">
                    <tr>
                        <td class="auto-style1" colspan="3">
                            <asp:TextBox ID="casenumber" placeholder="CaseNumber" runat="server" CssClass="w3-padding-small" Width="280px" AutoCompleteType="Disabled" Text="2008164218"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style1" colspan="3">
                            <asp:TextBox ID="serialnumber" placeholder="SerialNumber" runat="server" CssClass="w3-padding-small" Width="280px" AutoCompleteType="Disabled" Text="791422000040"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style1" colspan="3">
                            <asp:TextBox ID="partnerserialnumber" placeholder="PartnerSerialNumber" runat="server" CssClass="w3-padding-small" Width="280px" AutoCompleteType="Disabled" Text="621539000263"></asp:TextBox>
                        </td>
                    </tr>
                    <br />

                    <tr>
                        <td class="auto-style1" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="3">&nbsp
                        <asp:TextBox ID="category1" placeholder="Category1" runat="server" Enabled="False" Width="170px">Hardware </asp:TextBox>
                            &nbsp&nbsp&nbsp
                        <asp:DropDownList ID="category2" placeholder="Category2" runat="server" Height="20pt" CausesValidation="True" OnSelectedIndexChanged="category2_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Text="Select"></asp:ListItem>
                            <asp:ListItem Text="FAS" Enabled="True" Value="FAS"> FAS</asp:ListItem>
                            <asp:ListItem Text=" FAS-MCC" Enabled="True" Value="FAS-MCC">FAS-MCC</asp:ListItem>
                            <asp:ListItem Value="">AFF</asp:ListItem>
                        </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="3">
                            <asp:Label ID="asup" runat="server" Text="Check ASUP" Font-Bold="True" Font-Size="Small"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="1">
                            <asp:RadioButton ID="on" runat="server" Text=" ON " GroupName="Asup_Status" />
                        </td>
                        <td rowspan="1">
                            <asp:RadioButton ID="aod" runat="server" Text=" AOD " GroupName="Asup_Status" />
                        </td>
                        <td rowspan="1">
                            <asp:RadioButton ID="off" runat="server" Text=" OFF " GroupName="Asup_Status" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="3">
                            <asp:Label ID="sym" runat="server" Text="Select Current Case Symptom" Font-Bold="True" Font-Size="Small"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="1">
                            <asp:RadioButton ID="failed" runat="server" Text=" FAILED " GroupName="Symptom" />
                        </td>
                        <td rowspan="1">
                            <asp:RadioButton ID="missing" runat="server" Text=" MISSING " GroupName="Symptom" />
                        </td>
                        <td rowspan="1">
                            <asp:RadioButton ID="alert" runat="server" Text=" ALERT " GroupName="Symptom" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="auto-style1" colspan="3" class="auto-style3" style="padding-right: 15px; padding-left: 15px; text-align: left; margin-right: 10px; margin-left: 10px;">
                            <asp:CheckBox ID="single" runat="server" Text=" SINGLE" />
                        </td>

                    </tr>
                    <br />

                    <tr>
                        <td class="auto-style1" colspan="3" style="padding-right: 15px; padding-left: 15px; text-align: left; margin-right: 10px; margin-left: 10px;">
                            <asp:CheckBox ID="multiple" runat="server" Text=" MULTIPLE" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="auto-style1" colspan="3">
                            <asp:Button ID="search" runat="server" Text=" SEARCH" align="center" CssClass="w3-button w3-light-green w3-round-large" Width="140px" Style="margin-top: 3%; margin-left: 70px; margin-right: 60px;" ToolTip="search for Duplicate Cases" OnClick="btnsearch_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="2">
                            <asp:Label ID="Label1" runat="server" Style="margin-left: 80px" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
