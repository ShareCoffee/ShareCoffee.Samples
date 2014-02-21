(function() {


  window.SearchApp = angular.module("SearchApp", []);

  window.SearchApp.controller('searchController', [
    '$scope', 'searchService', function($scope, searchService) {
      $scope.queryText = "";
      $scope.results = [];
      $scope.onResultsReceived = function(data) {
        var searchResults, sr, _i, _len, _results;
        searchResults = data.d.query.PrimaryQueryResult.RelevantResults.Table.Rows.results;
        _results = [];
        for (_i = 0, _len = searchResults.length; _i < _len; _i++) {
          sr = searchResults[_i];
          _results.push((function(sr) {
            return $scope.results.push({
              title: sr.Cells.results[3].Value,
              author: sr.Cells.results[4].Value,
              link: sr.Cells.results[6].Value
            });
          })(sr));
        }
        return _results;
      };
      $scope.onError = function(a, b, c) {
        console.log(a);
        console.log(b);
        return console.log(c);
      };
      return $scope.search = function(queryText) {
        return searchService.queryFor(queryText, $scope.onResultsReceived, $scope.onError);
      };
    }
  ]);

  window.SearchApp.service('searchService', [
    '$http', function($http) {
      return {
        queryFor: function(queryText, onSuccess, onError) {
          var properties;
          properties = ShareCoffee.REST.build.read["for"].angularJS({
            url: "" + ShareCoffee.Url.Query + "?querytext='" + queryText + "'"
          });
          return $http(properties).success(onSuccess).error(onError);
        }
      };
    }
  ]);

}).call(this);
