angular.module('mi')

class @ElementsController
  constructor: (@model, @state) ->
    @load()

  load: ->
    @model.load()
    .then (elements) =>
      @elements = elements
      if @state.params.id
        @edit(id: @state.params.id)

  new: ->
    @state.go("#{@elements.route}.new")
    .then => @element = null

  edit: (element) ->
    @state.go("#{@elements.route}.edit", id: element.id)
    .then => @element = @model.copy(element)

  save: (element) ->
    @model.save(element)
    .then => @state.go @elements.route

  delete: (element) ->
    @model.delete(element)
    .then => @state.go @elements.route
