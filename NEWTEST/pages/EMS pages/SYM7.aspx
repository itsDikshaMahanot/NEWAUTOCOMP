<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SYM7.aspx.cs" Inherits="pages_EMS_pages_SYM7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div  style="padding: 5px 10px 5px 10px; margin: 10px; border-style: inset; border-width: thin; text-align: center; vertical-align: middle;">
            <b>Giveback failure due to disk check</b>
            <p style="text-align: left">
                <b>Symptom :</b><br />
                When there are failed disks in the system, a giveback fails with the disk check error.
            </p>
            <p style="text-align: left">
                <b>Solution :</b><br />
                Check the EMS logs to find out the disk that failed. Remove the faultydisk and replace with a new disk.
            </p>
        </div>
        </div>
    </form>
</body>
</html>
