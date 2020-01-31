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

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main" align="center">
        <table class="w3-round-xlarge" style="margin: 10px; border: medium outset #000000; padding: 20px;">
            <tr>
                <td>
                    <asp:TextBox ID="Username" placeholder="Username" runat="server" CssClass="w3-padding-small"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="Password" placeholder="Password" runat="server" CssClass="w3-padding-small" TextMode="Password"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td class="w3-center">
                    <asp:Button ID="Loginbtn" runat="server" Text="Login" OnClick="Loginbtn_Click" class="w3-button w3-round-large " BackColor="#00CC00" ForeColor="Black" Width="100px" />
                </td>

            </tr>

            <tr>
                <td align="center">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

