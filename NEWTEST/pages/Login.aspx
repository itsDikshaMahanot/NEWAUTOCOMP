<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/Basemaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

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
        <table class="w3-card w3-padding-24" align="center" style="border-collapse: separate; border-spacing: 15px; width: 30%; font-family: 'Bodoni MT';">
            <tr class="w3-center" >
                <td>
                    <asp:TextBox ID="Username" placeholder="Username" runat="server" CssClass="w3-padding-small"></asp:TextBox>
                </td>
            </tr>
            <tr class="w3-center">
                <td>
                    <asp:TextBox ID="Password" placeholder="Password" runat="server" CssClass="w3-padding-small" TextMode="Password"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td class="w3-center">
                    <asp:Button ID="Loginbtn" runat="server" Text="Login" OnClick="Loginbtn_Click" class="w3-button w3-round-large " BackColor="Blue" ForeColor="Black" Width="100px" />
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

