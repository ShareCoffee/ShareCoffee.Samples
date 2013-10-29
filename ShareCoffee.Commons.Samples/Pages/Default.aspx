<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />

    <!-- Add your JavaScript to the following file -->
    <script src="../Scripts/ShareCoffee.js" type="text/javascript"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    ShareCoffee.Commons.Samples
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <script type="text/javascript">

      document.addEventListener('DOMContentLoaded', function() {
        document.getElementById("AppWebUrl").innerHTML = ShareCoffee.Commons.getAppWebUrl();
        document.getElementById("ApiRootUrl").innerHTML = ShareCoffee.Commons.getApiRootUrl();
        document.getElementById("HostWebUrl").innerHTML = ShareCoffee.Commons.getHostWebUrl();
        document.getElementById("FormDigest").innerHTML = ShareCoffee.Commons.getFormDigest();
        document.getElementById("QueryString").innerHTML = ShareCoffee.Commons.getQueryString();
        document.getElementById("QueryStringValue").innerHTML = ShareCoffee.Commons.getQueryStringParameter("SPHostUrl");
        ShareCoffee.Commons.loadAppWebUrlFrom = function () {
          // load AppWebUrl from Cookie or somewhere else....
          return "https://mycustom-appweb.sharepoint.com/";
        };
        ShareCoffee.Commons.loadHostWebUrlFrom = function () {
          // load HostWebUrl from Cookie or somewhere else....
          return "https://dotnetrocks.sharepoint.com/sites/foobar";
        };
        document.getElementById("CustomAppWebUrl").innerHTML = ShareCoffee.Commons.getAppWebUrl();
        document.getElementById("CustomHostWebUrl").innerHTML = ShareCoffee.Commons.getHostWebUrl();
        });
    </script>
    <div>
        <p><b>AppWebUrl: </b><span id="AppWebUrl"></span></p>
        <p><b>API Root Url: </b><span id="ApiRootUrl"></span></p>
        <p><b>HostWebUrl: </b><span id="HostWebUrl"></span></p>
        <p><b>FormDigest: </b><span id="FormDigest"></span></p>
        <p><b>QueryString: </b><span id="QueryString"></span></p>
        <p><b>QueryString SPHostUrl Value: </b><span id="QueryStringValue"></span></p>
        <p><b>Custom - AppWebUrl: </b><span id="CustomAppWebUrl"></span></p>
        <p><b>Custom - HostWebUrl: </b><span id="CustomHostWebUrl"></span></p>
    </div>

</asp:Content>
