<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/Basemaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        .main {
            padding: 16px;
            margin-top: 50px;
            margin-bottom: 70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main" align="center">
        <table class="w3-round-xlarge" style="margin: 10px; border: medium outset #000000; padding: 20px;">
            <tr>
                <td>
                    <asp:textbox id="Username" placeholder="Username" runat="server" cssclass="w3-padding-small"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:textbox id="Password" placeholder="Password" runat="server" cssclass="w3-padding-small" textmode="Password"></asp:textbox>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td class="w3-center">
                    <asp:button id="Loginbtn" runat="server" text="Login" onclick="Loginbtn_Click" class="w3-button w3-round-large " backcolor="#00CC00" forecolor="Black" width="100px" />
                </td>

            </tr>

            <tr>
                <td align="center">
                    <asp:label id="Label1" runat="server" forecolor="Red"></asp:label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

