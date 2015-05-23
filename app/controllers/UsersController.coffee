controllers = angular.module 'controllers'
controllers.controller 'UsersController', ['User', '$scope', '$state'
  (User, $scope, $state) ->
    model = arguments[0]

    $scope.load = ->
      model.load (elements) ->
        $scope.elements = elements
        $scope.element = model.copy($state.params) if $state.params.id

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
