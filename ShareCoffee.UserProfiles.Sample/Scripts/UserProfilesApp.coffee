# CoffeeScript
window.UserProfilesApp = angular.module "UserProfilesApp", []

window.UserProfilesApp.service 'userProfilesService', ['$http', ($http)->
  {
    loadMyProfile: (onSuccess, onError) ->
      properties = ShareCoffee.REST.build.read.for.angularJS
        url: ShareCoffee.Url.GetMyProperties
      $http(properties).success(onSuccess).error(onError)
  }
]


window.UserProfilesApp.controller 'userProfilesController', ['$scope','userProfilesService', ($scope,userProfilesService) ->
  $scope.name = ''
  $scope.email = ''
  $scope.job = ''
  $scope.profilePicture = ''
  
  $scope.onProfileLoaded = (data) ->
    $scope.name = data.d.DisplayName
    $scope.job = data.d.Title
    $scope.email = data.d.Email
    $scope.profilePicture = data.d.PictureUrl
    
  $scope.onError = (a,b,c) ->
    console.log a
    console.log b
    console.log c
    
  $scope.loadProfile = () ->
    userProfilesService.loadMyProfile $scope.onProfileLoaded, $scope.onError
    
  $scope.loadProfile()
]
