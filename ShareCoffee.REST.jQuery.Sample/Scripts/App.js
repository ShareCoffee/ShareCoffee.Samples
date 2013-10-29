/// <reference path="sharecoffee.js" />
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
var customListId = null;
var customListIdHostWeb = null;

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
    $.ajax(ShareCoffee.REST.build.read.for.jQuery({ url: "web/lists/?$select=Title,Id" }))
      .done(onListsLoaded)
      .fail(onError);
  return supressPageReload(e);
  });

  $("#updateList").click(function (e) {
    var payload = {
      '__metadata': { 'type': 'SP.List' },
      'Title': 'CHANGED BY REST - Thorstens list'
    };
    $.ajax(ShareCoffee.REST.build.update.for.jQuery({ url: "web/lists('" + customListId + "')", payload: payload }))
      .done(onListUpdated)
      .fail(onError);
    return supressPageReload(e);
  });

  $("#deleteList").click(function (e) {
    $.ajax(ShareCoffee.REST.build.delete.for.jQuery({ url: "web/lists('" + customListId + "')" }))
      .done(onListDeleted)
      .fail(onError);
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
    $.ajax(ShareCoffee.REST.build.create.for.jQuery({ url: "web/lists/", payload: payload }))
      .done(onListCreated)
      .fail(onError);
    return supressPageReload(e);
  });


  $("#readListsOnHostWeb").click(function (e) {
    $.ajax(ShareCoffee.REST.build.read.for.jQuery({ url: "web/lists/?$select=Title,Id", hostWebUrl: ShareCoffee.Commons.getHostWebUrl() }))
      .done(onHostWebListsLoaded)
      .fail(onError);
    return supressPageReload(e);
  });

  $("#updateListOnHostWeb").click(function (e) {
    var payload = {
      '__metadata': { 'type': 'SP.List' },
      'Title': 'CHANGED BY REST - Thorstens list'
    };
    $.ajax(ShareCoffee.REST.build.update.for.jQuery({ url: "web/lists('" + customListIdHostWeb + "')", payload: payload, hostWebUrl: ShareCoffee.Commons.getHostWebUrl() }))
      .done(onListUpdated)
      .fail(onError);
    return supressPageReload(e);
  });

  $("#deleteListOnHostWeb").click(function (e) {
    $.ajax(ShareCoffee.REST.build.delete.for.jQuery({ url: "web/lists('" + customListIdHostWeb + "')", hostWebUrl: ShareCoffee.Commons.getHostWebUrl() }))
      .done(onListDeleted)
      .fail(onError);
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
    $.ajax(ShareCoffee.REST.build.create.for.jQuery({ url: "web/lists/", payload: payload, hostWebUrl: ShareCoffee.Commons.getHostWebUrl() }))
      .done(onListCreated)
      .fail(onError);
    return supressPageReload(e);
  });

});