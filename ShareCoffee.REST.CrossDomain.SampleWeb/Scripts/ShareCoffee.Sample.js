/// <reference path="ShareCoffee/ShareCoffee.js" />
customListId = null;
customHostWebListId = null;

function onError(data) {
  if (console && console.log) {
    console.log(data);
  }
}

function onHostWebListsLoaded(data) {
  var lists = JSON.parse(data.body).d.results;
  var target = $("#hostWebLists");
  target.empty();
  $.each(lists, function (index, item) {
    $("<li>ListName <b>" + item.Title + "</b> (" + item.Id + ")</li>").appendTo(target);
    if (item.Title.toLowerCase().indexOf('thorsten') > -1) {
      customHostWebListId = item.Id;
    }
  });
}

function onAppWebListsLoaded(data) {
  var lists = JSON.parse(data.body).d.results;
  var target = $("#lists");
  target.empty();
  $.each(lists, function (index, item) {
    $("<li>ListName <b>" + item.Title + "</b> (" + item.Id + ")</li>").appendTo(target);
    if (item.Title.toLowerCase().indexOf('thorsten') > -1) {
      customListId = item.Id;
    }
  });
}

function onListCreated() {
  alert("List has been created");
}

function onListUpdated() {
  alert("List has been updated");
}

function onListDeleted() {
  alert("List has been deleted");
}


function supressPageReload(e) {
  e.preventDefault();
  return false;
};

function addList(onHostWeb) {
  var executor = new SP.RequestExecutor(ShareCoffee.Commons.getAppWebUrl());
  var properties = {
    url: 'web/lists',
    payload: {'__metadata': { 'type': 'SP.List' },'AllowContentTypes': true,'BaseTemplate': 100,'ContentTypesEnabled': true,'Description': 'My list created by REST','Title': "Thorstens List"},
    onSuccess: onListCreated,
    onError: onError
  };
  if (onHostWeb) {
    properties.hostWebUrl = ShareCoffee.Commons.getHostWebUrl();
  } 
  executor.executeAsync(ShareCoffee.CrossDomain.build.create.for.SPCrossDomainLib(properties));
}

function updateList(onHostWeb) {
  var executor = new SP.RequestExecutor(ShareCoffee.Commons.getAppWebUrl());
  var properties = {
    
    payload: {
      '__metadata': { 'type': 'SP.List' },
      'Title': 'CHANGED BY REST - Thorstens list'
    },
    onSuccess: onListUpdated,
    onError: onError
  };
  if (onHostWeb) {
    properties.url = "web/lists('" + customHostWebListId + "')";
    properties.hostWebUrl = ShareCoffee.Commons.getHostWebUrl();
  } else {
    properties.url = "web/lists('" + customListId + "')";
  }
  executor.executeAsync(ShareCoffee.CrossDomain.build.update.for.SPCrossDomainLib(properties));
}

function deleteList(onHostWeb) {
  var executor = new SP.RequestExecutor(ShareCoffee.Commons.getAppWebUrl());
  var properties = {
    onSuccess: onListDeleted,
    onError: onError
  };
  if (onHostWeb) {
    properties.url = "web/lists('" + customHostWebListId + "')";
    properties.hostWebUrl = ShareCoffee.Commons.getHostWebUrl();
  } else {
    properties.url = "web/lists('" + customListId + "')";
  }
  executor.executeAsync(ShareCoffee.CrossDomain.build.delete.for.SPCrossDomainLib(properties));
}
function refreshLists(onHostWeb) {


  var executor = new SP.RequestExecutor(ShareCoffee.Commons.getAppWebUrl());
  var properties = {
    url: 'web/lists',
    onError: onError
  };
  if (onHostWeb) {
    properties.onSuccess = onHostWebListsLoaded;
    properties.hostWebUrl = ShareCoffee.Commons.getHostWebUrl();
  } else {
    properties.onSuccess = onAppWebListsLoaded;
  }
  executor.executeAsync(ShareCoffee.CrossDomain.build.read.for.SPCrossDomainLib(properties));
};
$(document).ready(function () {

  ShareCoffee.CrossDomain.loadCrossDomainLibrary();
  $("#addList").click(function (e) {
    addList(false);
    return supressPageReload(e);
  });

  $("#addListOnHostWeb").click(function (e) {
    addList(true);
    return supressPageReload(e);

  });


  $("#readLists").click(function (e) {
    refreshLists(false);
    return supressPageReload(e);
  });

  $("#readListsOnHostWeb").click(function (e) {
    refreshLists(true);
    return supressPageReload(e);
  });

  $("#updateList").click(function (e) {
    updateList(false);
    return supressPageReload(e);
  });

  $("#updateListOnHostWeb").click(function (e) {
    updateList(true);
    return supressPageReload(e);
  });


  $("#deleteList").click(function (e) {
    deleteList(false);
    return supressPageReload(e);
  });

  $("#deleteListOnHostWeb").click(function (e) {
    deleteList(true);
    return supressPageReload(e);
  });

});