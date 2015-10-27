'use strict'

angular.module 'MyApp', ['ngRoute']

.config ['$routeProvider', '$locationProvider', '$httpProvider',
  ($routeProvider, $locationProvider, $httpProvider) ->
    $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8'
    $httpProvider.defaults.transformRequest = (poData) ->
      str = []
      for key of poData
        str.push encodeURIComponent(key) + '=' + encodeURIComponent (poData[key])
      
      return str.join '&'
    
    $routeProvider
      .when '/', {
        templateUrl : 'templates/home',
        controller  : 'MainController'
      }
]

.controller 'MainController', ['$scope', '$http', 
  ($scope, $http) ->
    $scope.msg = 'hello world!'
    $scope.bookmarks = []
    $scope.bookmarkName = ''
    $scope.bookmarkURL = ''
    
    $scope.addBookmark = () ->
      $http
        url: 'bookmark'
        method: 'post'
        data:
          title: $scope.bookmarkName
          url: $scope.bookmarkURL
      .success (reponseData) ->
        $scope.getBookmarks()    

    $scope.removeBookmark = (poBookmark) ->
      $http
        url: 'bookmark/' + poBookmark.id
        method: 'post'
      .success (reponseData) ->
        $scope.getBookmarks()    

    $scope.getBookmarks = () ->
      $http
        url: 'bookmark'
        method: 'get'
      .success (responseData) ->
        $scope.bookmarks = responseData

    $scope.getBookmarks()
]
