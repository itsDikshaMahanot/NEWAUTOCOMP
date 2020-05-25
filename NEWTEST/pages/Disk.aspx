<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Disk.aspx.cs" Inherits="pages_Disk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <style>
        .style1 {
            padding-left: 5%;
            padding-right: 5%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div  align="center" style="margin-top: 2%; height: auto">
            <table class="shadow p-3 mb-5 bg-white rounded" style="padding: 10px 20px 10px 20px; align-content: center; width: 24%; border-collapse: separate; border-spacing: 10px;">
                <tr>
                    <td colspan="3">
                        <asp:TextBox ID="casenumber" placeholder="CaseNumber" runat="server" CssClass="form-control" Width="280px" AutoCompleteType="Disabled" Text="2008164218"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="3">
                        <asp:TextBox ID="serialnumber" placeholder="SerialNumber" runat="server" CssClass="form-control" Width="280px" AutoCompleteType="Disabled" Text="791422000040"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="3">
                        <asp:TextBox ID="partnerserialnumber" placeholder="PartnerSerialNumber" runat="server" CssClass="form-control" Width="280px" AutoCompleteType="Disabled" Text="621539000263"></asp:TextBox>
                    </td>
                </tr>
                <br />
                <tr>
                    <td colspan="3">&nbsp
                        <asp:TextBox ID="category1" placeholder="Category1" runat="server" Enabled="False" Width="150px">Hardware </asp:TextBox>
                        <asp:DropDownList ID="category2" placeholder="Category2" runat="server" Height="20pt" CausesValidation="True" OnSelectedIndexChanged="category2_SelectedIndexChanged" Width="120px">
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
                    <td class="text-center" colspan="3">
                        <asp:Label ID="asup" runat="server" Text="Check ASUP" Font-Bold="True" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td rowspan="1">
                        <asp:RadioButton ID="on" runat="server" Text="&nbspON " GroupName="Asup_Status" Font-Size="Medium" />
                    </td>
                    <td rowspan="1">
                        <asp:RadioButton ID="aod" runat="server" Text="&nbspAOD " GroupName="Asup_Status" Font-Size="Medium" />
                    </td>
                    <td rowspan="1">
                        <asp:RadioButton ID="off" runat="server" Text="&nbspOFF " GroupName="Asup_Status" Font-Size="Medium" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="text-center" colspan="3">
                        <asp:Label ID="sym" runat="server" Text="Select Current Case Symptom" Font-Bold="True" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td rowspan="1">
                        <asp:RadioButton ID="failed" runat="server" Text="&nbspFAILED " GroupName="Symptom" Font-Size="Medium" />
                    </td>
                    <td rowspan="1">
                        <asp:RadioButton ID="missing" runat="server" Text="&nbspMISSING " GroupName="Symptom" Font-Size="Medium" />
                    </td>
                    <td rowspan="1">
                        <asp:RadioButton ID="alert" runat="server" Text="&nbspALERT " GroupName="Symptom" Font-Size="Medium" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="3">
                        <asp:Button ID="search" runat="server" Text=" SEARCH" align="center" CssClass=" btn btn-success w3-round-large" Width="140px" Style="margin-top: 3%; margin-left: 70px; margin-right: 60px;" ToolTip="search for Duplicate Cases" OnClick="btnsearch_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2">
                        <asp:Label ID="Label1" runat="server" Style="margin-left: 80px" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
