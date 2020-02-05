<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SYM8.aspx.cs" Inherits="pages_EMS_pages_SYM8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="padding: 5px 10px 5px 10px; margin: 10px; border-style: inset; border-width: thin; text-align: center; vertical-align: middle;">
            <b>DEVICE_QUALIFICATION_FAILED CRITICAL</b>
            <p style="text-align: left; font-family: 'Courier New', Courier, monospace;">
                <b>Symptom :</b><br />
                Tue Oct 9 10:28:58 GMT [disk.dynamicqual.failure.occurred:error]: Device qualification failure occurred. Please refer to the qual_devices man page for corrective action. This problem must be corrected within 72 hour(s) to avoid a forced system shutdown. 
               <br />
                <b>Error message:</b> The following drive is not qualified by NetApp. For a list of qualified drives, please contact NetApp
                <br />
                <b>Error message:</b> Device qualification failure detected
                <br />
                <b>Error message:</b> Dev Qual failure timeout expired. Halting system.
            </p>
            <p style="text-align: left">
                <b>Cause :</b><br />
                In Data ONTAP 7.2.1, 7.2.2, and 7.2.3, the EMS and AutoSupport message can be triggered by the insertion of new NetApp hard disk drives (HDD). 
                In these releases, all disk drives need to be explicitly identified by information tables embedded in the kernel or in the Device Qualification Package. If a disk is not identifiable by either method, the system will initiate a system shutdown procedure which can only be averted by taking one of the recommended actions listed below within the subsequent 72-hour period.
                <br />
                NetApp recommends that the Disk Qualification Package be also updated on the storage system whenever new disks or disk shelves are added.
            </p>
            <p style="text-align: left">
                <b>Solution</b>
                <br />
                If the new HDDs were provided by NetApp or an authorized NetApp vendor, you can avert the shutdown by performing either of the following steps:
             <br />
                1. Install the latest Disk Qualification Package from the NOW site (a non-disruptive installation)
             <br />
                2. Remove the offending HDD(s)
            </p>
            <br />
            <p style="text-align: left">
                <b>Success Verification:</b>
                <br />
                Once the Disk Qualification Package is installed, the storage system will update its tables within five minutes. To verify that the failure condition has been cleared and the shutdown has been averted, you can:
                 <br />
                Look for the following EMS message:<br />
                1. Thu Sep 20 17:04:43 PDT [toaster: disk.dynamicqual.failure.cleared:notice]: Device qualification failure condition has been corrected. All devices have been qualified.<br />
                2. Issue the storage show disk -a CLI command.
                <br />
                3. If the disk shows Dynamically qualified = No, the HDD is fully supported.
                 <br />
                 <br />
                <a href=" https://mysupport.netapp.com/NOW/download/tools/diskqual/" class="a w3-hover-pale-blue" style="text-align: center; color: #0000FF;">Please refer to Disk Qualification Package Instructions.</a>
        </div>
        </div>
    </form>
</body>
</html>
