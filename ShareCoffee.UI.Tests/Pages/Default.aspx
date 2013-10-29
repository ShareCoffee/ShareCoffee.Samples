<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />

    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript" src="../Scripts/ShareCoffee/ShareCoffee.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    ShareCoffee.UI.Samples
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <script type="text/javascript">
      
      $(document).ready(function () {
        var supressPageReload = function (e) {
          e.preventDefault();
          return false;

        };
        // Notifications
        var stickyNotificationId = null;
        $("#showNotification").click(function (e) {
          ShareCoffee.UI.showNotification("My notification", false);
          return supressPageReload(e);
        });
        $("#showStickyNotification").click(function (e) {
          stickyNotificationId = ShareCoffee.UI.showNotification("My sticky notification", true);
          return supressPageReload(e);
        });

        $("#removeStickyNotification").click(function (e) {
          ShareCoffee.UI.removeNotification(stickyNotificationId);
          return supressPageReload(e);
        });

        // Status
        var lastStatusId = null;
        $("#showStatus").click(function (e) {
          lastStatusId = ShareCoffee.UI.showStatus("Status Title", "ShareCoffee <b>Status</b>", false);
          return supressPageReload(e);
        });

        $("#showStatusOnTop").click(function (e) {
          lastStatusId = ShareCoffee.UI.showStatus("Status Title", "ShareCoffee <b>Status</b> displayed on top", true);
          return supressPageReload(e);
        });

        $("#setStatusColorRed").click(function (e) {
          ShareCoffee.UI.setStatusColor(lastStatusId, 'red');
          return supressPageReload(e);
        });

        $("#setStatusColorYellow").click(function (e) {
          ShareCoffee.UI.setStatusColor(lastStatusId, 'yellow');
          return supressPageReload(e);
        });

        $("#setStatusColorBlue").click(function (e) {
          ShareCoffee.UI.setStatusColor(lastStatusId, 'blue');
          return supressPageReload(e);
        });

        $("#removeLastStatus").click(function (e) {
          ShareCoffee.UI.removeStatus(lastStatusId);
          return supressPageReload(e);
        });

        $("#removeAllStatusMessages").click(function (e) {
          ShareCoffee.UI.removeAllStatus();
          return supressPageReload(e);
        });
      });
    </script>
  <h3>
    Notifications
  </h3>
    <div>
        <input id="showNotification" type="button" value="Show Notification" />
        <input id="showStickyNotification" type="button" value="Show sticky Notification" />
        <input id="removeStickyNotification" type="button" value="Remove sticky Notification" />
        
    </div>
  <br />
  <h3>
    Status Messages
  </h3>
  <div>
    <input id="showStatus" type="button" value="Show Status" />
    <input id="showStatusOnTop" type="button" value="Show sticky Notification" />
    <input id="setStatusColorRed" type="button" value="make last status red" />
    <input id="setStatusColorYellow" type="button" value="Make last status yellow" />
    <input id="setStatusColorBlue" type="button" value="Make last status blue" />
    <input id="removeLastStatus" type="button" value="Remove last added status" />
    <input id="removeAllStatusMessages" type="button" value="Remove all status messages" />
  </div>

</asp:Content>
