controllers = angular.module 'controllers'
controllers.controller 'RolesController', ['$scope', '$routeParams', 'Role', '$state'
  ($scope, $routeParams, Role, $state) ->
    $scope.load = ->
      $scope.roles = Role.all()

    $scope.new = ->
      $state.go('roles.new')
        .then -> $scope.role = null

    $scope.edit = (role) ->
      $state.go('roles.edit', id: role.id)
        .then -> $scope.role = angular.copy(role)

    $scope.save = (role) ->
      Role.save role, ->
        $state.go 'roles'

    $scope.delete = (role) ->
      Role.delete role, ->
        $state.go 'roles'

    $scope.load()
]
