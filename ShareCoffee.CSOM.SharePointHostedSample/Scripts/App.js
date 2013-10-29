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
      $("<div>" + currentItem.get_item('AppName') + "</div>").appendTo($("#items"));
    }
  }, onError);

});