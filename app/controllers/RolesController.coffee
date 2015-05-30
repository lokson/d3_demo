angular.module('app').controller 'RolesController',
  class RolesController extends ElementsController
    @$inject: ['Roles', '$state', 'Views']
    constructor: (a,b,@Views) ->
      super

    load: ->
      @Views.load()
      .then (elements) => @views = elements
      .then => super

    edit_or_new: ->
      @populate_groups()

    view_changed: ->
      @element.subgroup_ids = []
      @populate_groups()

    populate_groups: ->
      if @element?.view_id?
        @groups = @Views.find(id: @element.view_id).groups
      else
        @groups = []

    is_subgroup_selected: (subgroup) ->
      subgroup.id in @element.subgroup_ids

    toggle_subgroup: (subgroup) ->
      if @is_subgroup_selected(subgroup)
        i = @element.subgroup_ids.indexOf subgroup.id
        @element.subgroup_ids.splice(i,1)
      else
        @element.subgroup_ids.push(subgroup.id)
