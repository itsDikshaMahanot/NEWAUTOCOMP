<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ASUP.aspx.cs" Inherits="pages_ASUP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <style>
fieldset 
	{
		border: 5px solid #ddd !important;
		padding: 6%;       
		position: relative;
		border-radius:10px;		
		width: 35%;
        margin-left: 250px;
        height: 200px;
        text-align:center;
        margin-top:10%;
}
	}	
	
		legend
		{
			font-size:14px;
			font-weight:bold;
			margin-bottom: 50px; 
			width: 10%; 
			border: 1px solid #ddd;
			border-radius: 4px; 		
			background-color: #ffffff;
		}
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset >
                <legend>ASUP Status</legend>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <p>
                            <asp:LinkButton ID="btnON" class="w3-button w3-hover-blue w3-round-large" runat="server" ToolTip="Click to check ASUP ON" OnClick="btnON_Click">ON</asp:LinkButton>
                            <asp:LinkButton ID="btnOFF" class="w3-button w3-hover-blue w3-round-large" runat="server" ToolTip="Click to check ASUP OFF" OnClick="btnOFF_Click">OFF</asp:LinkButton>
                            <asp:LinkButton ID="btnAOD" class="w3-button w3-hover-blue w3-round-large" runat="server" ToolTip="Click to check ASUP AOD" OnClick="btnAOD_Click">AOD</asp:LinkButton>
                        </p>
                    </div>
                </div>

                <br />
                <br />
                <asp:Label ID="Label1" runat="server" ForeColor="#3366CC" ToolTip="Collect Logs from Customer" Font-Size="Medium"></asp:Label>
            </fieldset>
        </div>
    </form>
</body>
</html>
