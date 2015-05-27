angular.module('mi').controller 'RolesController',
  class RolesController extends ElementsController
    @$inject: ['Roles', '$state', 'Views']

    constructor: (a,b,@Views) ->
      super

    load: ->
      @Views.load().then (elements) => @views = elements
      super

    edit: ->
      super.then => @set_groups()

    set_groups: ->
      @groups = @Views.find(id: @element.view_id).groups
