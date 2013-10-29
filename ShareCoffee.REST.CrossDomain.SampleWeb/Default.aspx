<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShareCoffee.REST.CrossDomain.SampleWeb.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShareCoffee REST CrossDomain Sample</title>
  <script src="Scripts/jquery-2.0.3.min.js" type="text/javascript"></script>
  <script src="Scripts/ShareCoffee/ShareCoffee.js" type="text/javascript"></script>
  <script src="Scripts/ShareCoffee.Sample.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="button" value="Create new List in AppWeb" id="addList" /><br />
    <input type="button" value="Rename list in AppWeb" id="updateList" /><br />
    <input type="button" value="Delete list in AppWeb" id="deleteList" /><br />
    <input type="button" value="Refresh" id="readLists" />
    <br />
     <ul id="lists">
       Please refresh first!
    </ul>

    <h3>Host Web</h3>
  
    <input type="button" value="Create new List in HostWeb" id="addListOnHostWeb" /><br />
    <input type="button" value="Rename list in HostWeb" id="updateListOnHostWeb" /><br />
    <input type="button" value="Delete list in HostWeb" id="deleteListOnHostWeb" /><br />
    <input type="button" value="Refresh" id="readListsOnHostWeb" />
  <br />
    <ul id="hostWebLists">
       Please refresh first!
    </ul>
    </form>
</body>
</html>
