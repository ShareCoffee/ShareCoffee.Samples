var scs = angular.module('scs', []);

scs.controller('ListController', ['$scope', '$routeParams', '$http', function ListController($scope, $routeParams, $http) {
  $scope.hostWebLists = [];
  $scope.hostWebCustomListId = null;
  
  $scope.lists = [];
  $scope.customListId = null;

  $scope.updateList = function () {
    var payload = {
      '__metadata': { 'type': 'SP.List' },
      'Title': 'CHANGED BY REST - Thorstens list'
    };
    $http(ShareCoffee.REST.build.update.for.angularJS({ url: "web/lists('" + $scope.customListId + "')", payload: payload }))
      .success(function (data) {
        ShareCoffee.UI.showNotification('List has been updated');
        $scope.refreshLists();
      });
  };

  $scope.deleteList = function () {
    $http(ShareCoffee.REST.build.delete.for.angularJS({ url: "web/lists('" + $scope.customListId + "')" }))
      .success(function (data) {
        ShareCoffee.UI.showNotification('List has been deleted');
        $scope.refreshLists();
      });
  };

  $scope.addList = function () {
    var payload = {
      '__metadata': { 'type': 'SP.List' },
      'AllowContentTypes': true,
      'BaseTemplate': 100,
      'ContentTypesEnabled': true,
      'Description': 'My list created by REST',
      'Title': "Thorstens List"
    };

    $http(ShareCoffee.REST.build.create.for.angularJS({ url: "web/lists/", payload: payload }))
      .success(function (data) {
        ShareCoffee.UI.showNotification('List has been created');
        $scope.refreshLists();
        $scope.customListId = data.d.Id;
      })
      .error(function (data,status) {
        console.log(data);
        console.log(status)
      });
  };

  $scope.refreshLists = function () {
    $http(ShareCoffee.REST.build.read.for.angularJS({ url: 'web/lists?$select=Title,Id' }))
      .success(function (data) {
        $scope.lists = data.d.results;
      }).
    error(function (data, status) {
      console.log(data);
      console.log(status);
    });
  };

  $scope.updateListOnHostWeb = function () {
    var payload = {
      '__metadata': { 'type': 'SP.List' },
      'Title': 'CHANGED BY REST - Thorstens list'
    };
    $http(ShareCoffee.REST.build.update.for.angularJS({ url: "web/lists('" + $scope.hostWebCustomListId + "')", hostWebUrl: ShareCoffee.Commons.getHostWebUrl(), payload: payload }))
      .success(function (data) {
        ShareCoffee.UI.showNotification('List has been updated');
        $scope.refreshListsOnHostWeb();
      });
  };

  $scope.deleteListOnHostWeb = function () {
    $http(ShareCoffee.REST.build.delete.for.angularJS({ url: "web/lists('" + $scope.hostWebCustomListId + "')", hostWebUrl: ShareCoffee.Commons.getHostWebUrl()}))
      .success(function (data) {
        ShareCoffee.UI.showNotification('List has been deleted');
        $scope.refreshListsOnHostWeb();
      });
  };

  $scope.addListOnHostWeb = function () {
    var payload = {
      '__metadata': { 'type': 'SP.List' },
      'AllowContentTypes': true,
      'BaseTemplate': 100,
      'ContentTypesEnabled': true,
      'Description': 'My list created by REST',
      'Title': "Thorstens List"
    };

    $http(ShareCoffee.REST.build.create.for.angularJS({ url: "web/lists/", payload: payload, hostWebUrl: ShareCoffee.Commons.getHostWebUrl() }))
      .success(function (data) {
        ShareCoffee.UI.showNotification('List has been created');
        $scope.refreshListsOnHostWeb();
        $scope.hostWebCustomListId = data.d.Id;
      })
      .error(function (data, status) {
        console.log(data);
        console.log(status)
      });
  };

  $scope.refreshListsOnHostWeb = function () {
    $http(ShareCoffee.REST.build.read.for.angularJS({ url: 'web/lists?$select=Title,Id', hostWebUrl: ShareCoffee.Commons.getHostWebUrl() }))
      .success(function (data) {
        $scope.hostWebLists = data.d.results;
      }).
    error(function (data, status) {
      console.log(data);
      console.log(status);
    });
  };
}]);