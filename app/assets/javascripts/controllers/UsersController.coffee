controllers = angular.module 'controllers'
controllers.controller 'UsersController', ['$scope', '$routeParams', 'User', '$state'
  ($scope, $routeParams, User, $state) ->
    $scope.load = ->
      $scope.users = User.all()

    $scope.new = ->
      $scope.user = null
      $state.go 'users.new'

    $scope.edit = (user) ->
      $state.go('users.edit', id: user.id)
        .then -> $scope.user = angular.copy(user)

    $scope.save = (user) ->
      $scope.users.save(user)
      $state.go 'users'

    $scope.delete = (user) ->
      $scope.users.delete(user)
      $state.go 'users'

    $scope.load()
]
