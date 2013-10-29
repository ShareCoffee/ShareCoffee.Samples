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
    <script type="text/javascript" src="../Scripts/ShareCoffee.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Page Title
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
  <h3>Accessing data in the HostWeb</h3>
  <p><b>You have to require corresponding permissions within the AppManifest file and grant access to Apps in Testing list.</b></p>
  <div id="items"></div>
  <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
      var onError = function (sender, args) {
        if (console && console.log) {
          console.log(args.get_message());
        }
      };
      var ctx = SP.ClientContext.get_current();
      var hostWeb = ShareCoffee.CSOM.getHostWeb(ctx, ShareCoffee.Commons.getHostWebUrl());
      var listItems = hostWeb.get_lists().getByTitle('Apps in Testing').getItems(SP.CamlQuery.createAllItemsQuery());
      ctx.load(listItems);
      ctx.executeQueryAsync(function () {
        var enumerator = listItems.getEnumerator();
        while (enumerator.moveNext()) {
          var currentItem = enumerator.get_current();
          $("<div>" + currentItem.get_item('AppName') +"</div>").appendTo($("#items"));
        }
      }, onError);
      
    });
  </script>

</asp:Content>
