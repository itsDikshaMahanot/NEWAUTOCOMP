<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Disksearch.aspx.cs" Inherits="pages_Disksearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <form id="form1" runat="server">       
    <br />
    <br />
    <div class="container align="center">
        <asp:GridView ID="GridView1" runat="server" CellPadding="10" forecolor="#333333" gridlines="None" autogeneratecolumns="False" cellspacing="5"  HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Case_No." HeaderText="Case_No." ReadOnly="True" SortExpression="Case_No." />
                    <asp:BoundField DataField="Case_Status" HeaderText="Case_Status" ReadOnly="True" SortExpression="Case_Status" />
                    <asp:BoundField DataField="Symptom" HeaderText="Symptom" ReadOnly="True" SortExpression="Symptom" />
                    <%--<asp:HyperLinkField DataNavigateUrlFields="Link" DataTextField="Link" HeaderText="Link" SortExpression="Link" Text="Link" />--%>
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
            </asp:GridView><br />              
         </div>
        <br />
        <div align="center">
            <asp:Label ID="Label2" runat="server"  style="margin-left:70px"></asp:Label>
        </div>
    </form>
</body>
</html>
