controllers = angular.module 'controllers'
controllers.controller 'UsersController', ['$scope', '$routeParams', 'User', '$state'
  ($scope, $routeParams, User, $state) ->
    $scope.load = ->
      $scope.users = User.all()

    $scope.new = ->
      $state.go('users.new')
        .then -> $scope.user = null

    $scope.edit = (user) ->
      $state.go('users.edit', id: user.id)
        .then -> $scope.user = angular.copy(user)

    $scope.save = (user) ->
      User.save user, ->
        $state.go 'users'

    $scope.delete = (user) ->
      User.delete user, ->
        $state.go 'users'

    $scope.load()
]
