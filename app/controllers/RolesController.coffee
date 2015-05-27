angular.module('mi').controller 'RolesController',
  class RolesController extends ElementsController
    @$inject: ['Roles', '$state', 'Views']

    constructor: (a,b,@Views) ->
      super

    load: ->
      super
      @Views.load()
      .then (elements) =>
        @views = elements
        @update_groups()

    update_groups: ->
      @groups = @Views.find(id: @element.view_id).obj.groups
