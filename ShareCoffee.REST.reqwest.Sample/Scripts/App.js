var customListId = null;
var customListIdHostWeb = null;


var supressPageReload = function (e) {
  e.preventDefault();
  return false;
};

var onError = function (xhr, status, error) {
  if (console && console.log) {
    console.log("Error while interacting with SP-REST-Interface: " + error);
  }
};
var onListDeleted = function (data) {
  ShareCoffee.UI.showNotification("List has been deleted");
};
var onListUpdated = function (data) {
  ShareCoffee.UI.showNotification("List has been updated");
};
var onListCreated = function (data) {
  ShareCoffee.UI.showNotification("List has been created");
};

var onListsLoaded = function (data) {
  var target = $("#lists");
  target.empty();
  $.each(data.d.results, function (index, element) {
    $("<span>ListName: <b>" + element.Title + "</b> (" + element.Id + ")</span><br/>").appendTo(target);
    if (element.Title.toLowerCase().indexOf('thorsten') > -1) {
      customListId = element.Id;
    }
  });
};

var onHostWebListsLoaded = function (data) {
  var target = $("#hostWebLists");
  target.empty();
  $.each(data.d.results, function (index, element) {
    $("<span>ListName: <b>" + element.Title + "</b> (" + element.Id + ")</span><br/>").appendTo(target);
    if (element.Title.toLowerCase().indexOf('thorsten') > -1) {
      customListIdHostWeb = element.Id;
    }
  });
};


$(document).ready(function () {

  $("#readLists").click(function (e) {
    reqwest(ShareCoffee.REST.build.read.for.reqwest({
      url: "web/lists/?$select=Title,Id",
      onSuccess: onListsLoaded,
      onError: onError
    }));
    return supressPageReload(e);
  });

  $("#updateList").click(function (e) {
    var payload = {
      '__metadata': { 'type': 'SP.List' },
      'Title': 'CHANGED BY REST - Thorstens list'
    };
    reqwest(ShareCoffee.REST.build.update.for.reqwest({
      url: "web/lists('" + customListId + "')",
      onSuccess: onListUpdated,
      onError: onError,
      payload: payload
    }));
    return supressPageReload(e);
  });

  $("#deleteList").click(function (e) {
    reqwest(ShareCoffee.REST.build.delete.for.reqwest({
      url: "web/lists('" + customListId + "')",
      onSuccess: onListDeleted,
      onError: onError
    }));
    return supressPageReload(e);
  });

  $("#addList").click(function (e) {
    var payload = {
      '__metadata': { 'type': 'SP.List' },
      'AllowContentTypes': true,
      'BaseTemplate': 100,
      'ContentTypesEnabled': true,
      'Description': 'My list created by REST',
      'Title': "Thorstens List"
    };
    reqwest(ShareCoffee.REST.build.create.for.reqwest({ url: "web/lists/", onSuccess: onListCreated, onError: onError, payload: payload }));
    return supressPageReload(e);
  });

  $("#readListsOnHostWeb").click(function (e) {
    reqwest(ShareCoffee.REST.build.read.for.reqwest({
      url: "web/lists/?$select=Title,Id",
      hostWebUrl: ShareCoffee.Commons.getHostWebUrl(),
      onSuccess: onHostWebListsLoaded,
      onError: onError
    }));
    return supressPageReload(e);
  });

  $("#updateListOnHostWeb").click(function (e) {
    var payload = {
      '__metadata': { 'type': 'SP.List' },
      'Title': 'CHANGED BY REST - Thorstens list'
    };
    reqwest(ShareCoffee.REST.build.update.for.reqwest({
      url: "web/lists('" + customListIdHostWeb + "')",
      hostWebUrl: ShareCoffee.Commons.getHostWebUrl(),
      onSuccess: onListUpdated,
      onError: onError,
      payload: payload
    }));
    return supressPageReload(e);
  });

  $("#deleteListOnHostWeb").click(function (e) {
    reqwest(ShareCoffee.REST.build.delete.for.reqwest({
      url: "web/lists('" + customListIdHostWeb + "')",
      hostWebUrl: ShareCoffee.Commons.getHostWebUrl(),
      onSuccess: onListDeleted,
      onError: onError
    }));
    return supressPageReload(e);
  });

  $("#addListOnHostWeb").click(function (e) {
    var payload = {
      '__metadata': { 'type': 'SP.List' },
      'AllowContentTypes': true,
      'BaseTemplate': 100,
      'ContentTypesEnabled': true,
      'Description': 'My list created by REST',
      'Title': "Thorstens List"
    };
    reqwest(ShareCoffee.REST.build.create.for.reqwest({
      url: "web/lists/",
      hostWebUrl: ShareCoffee.Commons.getHostWebUrl(),
      onSuccess: onListCreated,
      onError: onError,
      payload: payload
    }));
    return supressPageReload(e);
  });

});