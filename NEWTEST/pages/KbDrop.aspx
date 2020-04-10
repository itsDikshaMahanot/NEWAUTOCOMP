<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KbDrop.aspx.cs" Inherits="pages_KbDrop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="col-12 col-md-9 col-xl-8 py-md-3 pl-md-5 bd-content main col-xs-8">
            <asp:dropdownlist class="mydropdownlist" id="DropDownList1" runat="server" autopostback="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"  >
                        <asp:ListItem Enabled="True"> -- Select Issue --</asp:ListItem>
                        <asp:ListItem class="dropdown-item">Failed</asp:ListItem>
                        <asp:ListItem class="dropdown-item">Alert</asp:ListItem>
                        <asp:ListItem class="dropdown-item">Multipath Error</asp:ListItem>
                        <asp:ListItem class="dropdown-item">Multi-Disk Error</asp:ListItem>
                        <asp:ListItem class="dropdown-item">Multi Disk Failure</asp:ListItem>
            </asp:dropdownlist>
                <br /><br /><br />

                <asp:gridview id="GridView1" runat="server" cellpadding="10" forecolor="#333333" gridlines="None" autogeneratecolumns="False" cellspacing="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">

                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="kb_id" HeaderText="Kb_id" ReadOnly="True" SortExpression="kb_id" />
                    <asp:BoundField DataField="kb_title" HeaderText="Title" ReadOnly="True" SortExpression="kb_title" />
                    <asp:HyperLinkField DataNavigateUrlFields="kb_link" DataTextField="kb_link" HeaderText="Link" />
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
            </asp:gridview>
        </div>
    </form>
</body>
</html>
