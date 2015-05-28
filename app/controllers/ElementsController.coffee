angular.module('mi')

class @ElementsController
  constructor: (@model, @state) ->
    @load()

  load: ->
    @model.load()
    .then (elements) =>
      @elements = elements
      @edit(id: @state.params.id) if @state.params.id

  edit_or_new: ->

  new: ->
    @state.go("#{@elements.route}.new")
    .then => @element = null
    .then => @edit_or_new()

  edit: (element) ->
    @state.go("#{@elements.route}.edit", id: element.id)
    .then => @element = @model.copy(element)
    .then => @edit_or_new()

  save: (element) ->
    @model.save(element)
    .then => @state.go @elements.route

  delete: (element) ->
    @model.delete(element)
    .then => @state.go @elements.route
