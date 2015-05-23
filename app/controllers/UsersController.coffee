controllers = angular.module 'controllers'
controllers.controller 'UsersController', ['User', '$scope', '$routeParams', '$state'
  (User, $scope, $routeParams, $state) ->
    model = arguments[0]

    $scope.load = ->
      $scope.elements = model.all()

    $scope.new = ->
      $state.go("#{model.route_key}.new")
        .then -> $scope.element = null

    $scope.edit = (element) ->
      $state.go("#{model.route_key}.edit", id: element.id)
        .then -> $scope.element = angular.copy(element)

    $scope.save = (element) ->
      model.save element, ->
        $state.go "#{model.route_key}"

    $scope.delete = (element) ->
      model.delete element, ->
        $state.go "#{model.route_key}"

    $scope.load()
]
