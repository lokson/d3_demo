angular.module('mi').controller 'RolesController',
  class RolesController extends ElementsController
    @$inject: ['Roles', '$state', 'Views']

    constructor: (a,b,@Views) ->
      window.c = @
      super

    load: ->
      @Views.load().then (elements) => @views = elements
      super

    edit: ->
      super.then => @set_groups()

    view_changed: ->
      @element.subgroup_ids = []
      @set_groups()

    set_groups: ->
      @groups = @Views.find(id: @element.view_id).groups

    is_subgroup_selected: (subgroup) ->
      subgroup.id in @element.subgroup_ids

    toggle_subgroup: (subgroup) ->
      if @is_subgroup_selected(subgroup)
        i = @element.subgroup_ids.indexOf subgroup.id
        @element.subgroup_ids.splice(i,1)
      else
        @element.subgroup_ids.push(subgroup.id)
