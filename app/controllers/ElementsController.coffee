# todo: find better way to pass it to angular (below is as a global)
class window.ElementsController
  constructor: (@model, @scope, @state) ->
    @model.load (elements) =>
      @scope.elements = elements
      @scope.element = @model.copy(@state.params) if @state.params.id

  new: ->
    @state.go("#{@model.route_key}.new")
    .then => @scope.element = null

  edit: (element) ->
    @state.go("#{@model.route_key}.edit", id: element.id)
    .then => @scope.element = angular.copy(element)

  save: (element) ->
    @model.save element, =>
      @state.go "#{@model.route_key}"

  delete: (element) ->
    @model.delete element, =>
      @state.go "#{@model.route_key}"