angular.module('mi')

class @ElementsController
  constructor: (@model, @state) ->
    @model.load (elements) =>
      @elements = elements
      @element = @model.copy(@state.params) if @state.params.id

  new: ->
    @state.go("#{@model.route_key}.new")
      .then => @element = null

  edit: (element) ->
    @state.go("#{@model.route_key}.edit", id: element.id)
      .then => @element = angular.copy(element)

  save: (element) ->
    @model.save element, =>
      @state.go "#{@model.route_key}"

  delete: (element) ->
    @model.delete element, =>
      @state.go "#{@model.route_key}"