/// <reference path="ShareCoffee/ShareCoffee.js" />

$(document).ready(function () {
  ShareCoffee.CrossDomain.loadCSOMCrossDomainLibraries(function () {

    var ctx = ShareCoffee.CrossDomain.getClientContext();
    var hostWeb = ShareCoffee.CrossDomain.getHostWeb(ctx);

    var appWeb = ctx.get_web();

    ctx.load(appWeb);
    ctx.load(hostWeb);

    ctx.executeQueryAsync(function () {
      $("#appWebTitle")[0].innerHTML = appWeb.get_title();
      $("#hostWebTitle")[0].innerHTML = hostWeb.get_title();

    }, function (sender, args) {
      console.log(args.get_message() + " " + args.get_stackTrace());
    });



  });
});