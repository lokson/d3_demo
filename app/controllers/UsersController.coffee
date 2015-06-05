angular.module('app').controller 'UsersController',
  class UsersController extends ElementsController
    @$inject: ['Users', '$state', '$filter', '$scope']
    constructor: (a,b,@filter,@scope) -> super

    edit: (element) ->
      @state.go("#{@elements.route}.edit", id: element.id)
      .then => @element = element
      .then => @edit_or_new()

    filtered_elements: =>
      @filter('filter')(@elements, name: @keywords)

    init: =>
      @scope.$watch @filtered_elements, @draw_graph, true

    draw_graph: (data) =>
      # bind data
      groups = d3.select('svg').selectAll('g').data(data, (d) -> d.id)

      # add
      group = groups.enter().append('g').attr('transform', (d) -> "translate(#{d.logins_count * 3}, 40)")
      group.append('circle')
      group.append('text')

      # remove
      groups.exit()
      .transition()
      .duration(600)
      .style('opacity', 0)
      .remove()

      # update
      groups
      .on('click', (d) => @edit(d))
      .style('opacity', 0.8)
      .transition()
      .duration(300)
      .attr('transform', (d) -> "translate(#{d.logins_count * 3}, 40)")
      .style('fill', 'red')

      groups.select('circle')
      .transition()
      .attr('r', (d) -> d.logins_count * 0.5)

      groups.select('text')
      .text((d) -> d.name)
      .attr('transform', (d) -> "rotate(70) translate(#{5 + d.logins_count * 0.5}, 5)")