﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Disk.aspx.cs" Inherits="pages_Disk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
           <div  >
        <div align="center">
            <table class="w3-centered auto-style2 w3-card-2" style="border: thin outset #000000; padding: 10px 20px 10px 20px; align-content: center">
                <tr>
                    <td class="auto-style1" colspan="3">  
                        <asp:TextBox ID="casenumber" placeholder="CaseNumber" runat="server" CssClass="w3-padding-small" Width="280px" ></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1" colspan="3"> 
                        <asp:TextBox ID="serialnumber" placeholder="SerialNumber" runat="server" CssClass="w3-padding-small" Width="280px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1" colspan="3">   
                        <asp:TextBox ID="partnerserialnumber" placeholder="PartnerSerialNumber" runat="server" CssClass="w3-padding-small" Width="280px"></asp:TextBox>
                    </td>
                </tr>
                <br />

                <tr>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="3">&nbsp
                        <asp:TextBox ID="category1" placeholder="Category1" runat="server" Enabled="False" Width="170px">Hardware </asp:TextBox>
                        &nbsp&nbsp&nbsp<asp:DropDownList ID="category2" placeholder="Category2" runat="server" Height="20pt">
                            <asp:ListItem Text="FAS"> FAS</asp:ListItem>
                            <asp:ListItem Text=" FAS-MCC">FAS-MCC</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                </tr>
                <tr >
                    
                        <td rowspan="1" >
                            <asp:RadioButton ID="failed" runat="server" Text=" FAILED " GroupName="Symptom" />
                        </td>
                        <td rowspan="1">
                            <asp:RadioButton ID="missing" runat="server" Text=" MISSING " GroupName="Symptom" />
                        </td>
                        <td rowspan="1">
                            <asp:RadioButton ID="alert" runat="server" Text=" ALERT " GroupName="Symptom" />
                        </td>
                   
                </tr>

                <tr>
                    <td class="auto-style1" colspan="3" class="auto-style3" style="padding-right: 15px; padding-left: 15px; text-align: left; margin-right: 10px; margin-left: 10px;">
                        <asp:CheckBox ID="single" runat="server" Text=" Single" />
                    </td>
                   
                </tr>
                <br />

                <tr>
                    <td class="auto-style1" colspan="3" style="padding-right: 15px; padding-left: 15px; text-align: left; margin-right: 10px; margin-left: 10px;">
                        <asp:CheckBox ID="multiple" runat="server" Text=" Multiple" />
                    </td>
                </tr>              
               
                <tr>
                    <td class="auto-style1" colspan="3"> 
                        <asp:Button ID="search" runat="server" Text=" SEARCH"  align="center" CssClass="w3-button w3-light-green w3-round-large"  Width="140px" style="margin-top:3%; margin-left: 70px; margin-right: 60px;" ToolTip="search for Duplicate Cases" OnClick="btnsearch_Click" />
                        <br />
                        <asp:Label ID="Label1" runat="server" style="margin-left:70px" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>