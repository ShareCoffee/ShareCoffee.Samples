# CoffeeScript
# /// <reference path="ShareCoffee/ShareCoffee.js" />
# /// <reference path="ShareCoffee.Search/ShareCoffee.Search.js" />
window.SearchApp = angular.module "SearchApp", []

window.SearchApp.controller 'searchController', ['$scope','searchService', ($scope, searchService) ->
  $scope.queryText = ""
  $scope.results = []

  $scope.onResultsReceived = (data) ->
    searchResults = data.d.query.PrimaryQueryResult.RelevantResults.Table.Rows.results
    for sr in searchResults
      do (sr) ->
        $scope.results.push
          title: sr.Cells.results[3].Value
          author: sr.Cells.results[4].Value
          link: sr.Cells.results[6].Value

  $scope.onError = (a,b,c) ->
    console.log a
    console.log b
    console.log c

  $scope.search = (queryText) ->
    searchService.queryFor queryText, $scope.onResultsReceived, $scope.onError
  
]

window.SearchApp.service 'searchService', ['$http', ($http) ->
  {
    queryFor: (queryText, onSuccess, onError) ->
      properties = ShareCoffee.REST.build.read.for.angularJS
        url: "#{ShareCoffee.Url.Query}?querytext='#{queryText}'"

      $http(properties).success(onSuccess).error(onError)
        
  }
]