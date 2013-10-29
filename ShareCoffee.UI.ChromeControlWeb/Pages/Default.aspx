<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShareCoffee.UI.ChromeControlWeb.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <script src="../Scripts/ShareCoffee/ShareCoffee.min.js" type="text/javascript"></script>
  <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
</head>
<body>
    <script type="text/javascript">
      var chromeSettings = new ShareCoffee.ChromeSettings("", "My AutoHosted SharePoint App",
        new ShareCoffee.SettingsLink("foo.html", "Foo", true),
        new ShareCoffee.SettingsLink("bar.html", "Bar", true));
      var onAppChromeLoaded = function () {
        console.log("chrome should be loaded now!");
      };
      ShareCoffee.UI.loadAppChrome("chrome-placeholder", chromeSettings, onAppChromeLoaded);

    </script>
    <div id="chrome-placeholder"></div>
    <form id="form1" runat="server">
      
    <div>
    
    </div>
    </form>
</body>
</html>
