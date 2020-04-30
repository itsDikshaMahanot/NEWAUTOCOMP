<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Disksearch.aspx.cs" Inherits="pages_Disksearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <style type="text/css">
        .auto-style1 {
            margin-top: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <div class="w3-center">
            <div class="w3-center">
                <br />
                <asp:Button ID="Button1" runat="server" BackColor="#FF9900" CssClass="w3-button w3-round-xlarge" OnClick="Button1_Click" Text="BACK" />
                <asp:GridView ID="GridView1" runat="server" CellPadding="10" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CellSpacing="5" HorizontalAlign="Center" onclick="GridView1_RowDataBound" CssClass="auto-style1">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="Case_No." DataTextField="Case_No." HeaderText="Case_No." DataNavigateUrlFormatString="https://smartsolvecm.netapp.com/ui/#/case/?Case_No.={0}">
                            <ItemStyle ForeColor="#0066FF" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="Case_Status" HeaderText="Case_Status" ReadOnly="True" SortExpression="Case_Status" />
                        <asp:BoundField DataField="Symptom" HeaderText="Symptom" ReadOnly="True" SortExpression="Symptom" />
                        <asp:BoundField DataField="Date_Open" HeaderText="Date_Open" ReadOnly="True" SortExpression="Date_Open" />
                        <asp:BoundField DataField="Date_closed" HeaderText="Date_closed" ReadOnly="True" SortExpression="Date_closed" />
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
                <br />
            </div>
            <br />
        </div>
        <br />
        <div align="center">
            <asp:Label ID="Label2" runat="server" Style="margin-left: 70px"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" BackColor="#FF9900" CssClass="w3-button w3-round-xlarge" OnClick="Button2_Click" Text="NEXT" />
        </div>
    </form>
</body>
</html>
