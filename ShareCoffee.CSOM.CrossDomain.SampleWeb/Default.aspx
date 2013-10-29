<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShareCoffee.CSOM.CrossDomain.SampleWeb.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <script src="https://ajax.aspnetcdn.com/ajax/3.5/MicrosoftAjax.js " type="text/javascript"></script>
  <script src="Scripts/jquery-2.0.3.js"></script>
  <script src="Scripts/ShareCoffee/ShareCoffee.js"></script>
  <script src="Scripts/ShareCoffee.Sample.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <b>AppWebTitle: </b><span id="appWebTitle"></span>
      <br />
      <b>HostWebTitle: </b><span id="hostWebTitle"></span>
    </div>
    </form>
</body>
</html>
