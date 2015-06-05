angular.module('app').controller 'UsersController',
  class UsersController extends ElementsController
    @$inject: ['Users', '$state', '$filter', '$scope']
    constructor: (a,b,@filter,@scope) -> super

    filtered_elements: =>
      @filter('filter')(@elements, name: @keywords)

    init: =>
      c = @

      f = (data) =>
        # bind data
        groups = d3.select('svg').selectAll('g').data(data, (d) -> d.id)

        # add
        group = groups.enter().append('g')
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
        .on('click', (d) -> c.edit(d))
        .style('opacity', 0.8)
        .attr('transform', (d) -> "translate(#{d.logins_count * 3}, 40)")
        .transition()
        .duration(300)
        .style('fill', 'red')

        groups.select('circle')
        .attr('r', (d) -> d.logins_count * 0.5)

        groups.select('text')
        .text((d) -> d.name)
        .attr('transform', (d) -> "rotate(70) translate(#{5 + d.logins_count * 0.5}, 5)")

      @scope.$watch @filtered_elements, f, true
