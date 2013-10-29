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
  <script type="text/javascript" src="../Scripts/angular.min.js"></script>
  <script type="text/javascript" src="../Scripts/ShareCoffee/ShareCoffee.js"></script>
  <!-- Add your JavaScript to the following file -->
  <script type="text/javascript" src="../Scripts/sharecoffee-sample.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
  Page Title
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

  <div ng-app="scs">
    <div ng-controller="ListController">
      <span class="sc-button" ng-click="addList()">Add List</span>
      <span class="sc-button" ng-click="updateList()">Update List</span>
      <span class="sc-button" ng-click="deleteList()">Delete List</span>
      <span class="sc-button" ng-click="refreshLists()">Refresh Lists</span>
      <ul ng-repeat="list in lists">
        <li>{{list.Title}} - ({{list.Id}})</li>
      </ul>
      <div class="divider"></div>
      <h3>HostWeb</h3>
      <div class="divider"></div>
      <span class="sc-button" ng-click="addListOnHostWeb()">Add List</span>
      <span class="sc-button" ng-click="updateListOnHostWeb()">Update List</span>
      <span class="sc-button" ng-click="deleteListOnHostWeb()">Delete List</span>
      <span class="sc-button" ng-click="refreshListsOnHostWeb()">Refresh Lists</span>
      <ul ng-repeat="list in hostWebLists">
        <li>{{list.Title}} - ({{list.Id}})</li>
      </ul>
    </div>
  </div>

</asp:Content>
