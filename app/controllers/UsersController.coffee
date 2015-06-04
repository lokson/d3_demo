#_chart = {}
#_chart.render = ->


angular.module('app').controller 'UsersController',
  class UsersController extends ElementsController
    @$inject: ['Users', '$state', '$filter', '$scope']
    constructor: (a,b,@filter,@scope) ->
      super

    filtered_elements: =>
      @filter('filter')(@elements, @keywords)



# d3.custom = {};
# d3.custom.barChart = function module() {

#      var chart = d3.custom.barChart();

#      scope.$watch('data', function (newVal, oldVal) {
#      chartEl.datum(newVal).call(chart);
#      });

#      gra = {}
#      gra = d3.custom

    init: ->
      #      .attr('cx', (d) -> d.logins_count * 3 )
      #      .attr('cy', 40)
      #      .attr('r', (d) -> d.logins_count * 0.5 )


      #      circles
#      .attr('cx', (d) -> console.log 'in transition' ; d.logins_count * 3 )
#      .attr('cy', 40*Math.random())
#      .attr('r', (d) -> d.logins_count * 0.5 )
#      .style('fill', 'red')
#      .duration(duration)
#      .ease(ease)
#      .attr
#        cx: (d) -> d.logins_count * 3
#        cy: 40
#        r: (d) -> d.logins_count * 0.5
#        width: barW,
#        x: function(d, i) { return x1(i) + gapSize/2; },
#        y: function(d, i) { console.log('[in attr y]'); return y1(d); },
#        height: function(d, i) { return chartH - y1(d);

#      f = (data) => vis.selectAll('circle').data(data)
#      @scope.$watch @filtered_elements, f, true

#      cal = (data) ->
#        console.log 'in calback'
#        console.log data

      f = (data) =>
        vis = d3.select('svg')

        circles = vis.selectAll('circle').data(@filtered_elements())

        circles.enter()
        .append('circle')
        .transition()
        .attr('cx', (d) -> d.logins_count * 3 )
        .attr('cy', 40)
        .attr('r', (d) -> d.logins_count * 0.5 )
        .style('fill', 'red')

        circles.exit()
        .transition()
        .style('opacity', 0)
        .remove()

#      vis.selectAll('circle').data(@filtered_elements())

#        console.log 'in controller @scope.$watch'
#        console.log data
#        debugger
#
#        vis.datum(data).call {
#          apply: (data) ->
#            console.log 'in calback.apply(data)'
#            console.log data
#        }

      @scope.$watch @filtered_elements, f, true

#        scope.$watch('data', function (newVal, oldVal) {
#        chartEl.datum(newVal).call(chart);
#      });


#      window.vis = vis

#      @scope.$watch @filtered_elements, (v) -> console.log v
#        vis.selectAll('circle').data(@filtered_elements)
#        .attr('cy', (d) -> d.logins_count * 3)


    new: ->
      console.log @state
      super













#      .data @filter('filter')(@elements,'y')


#<!DOCTYPE html>
#<html ng-app="myApp">
#<head>
#<meta charset="utf-8">
#<title>AngularJS + D3.js</title>
#  <script src="//cdnjs.cloudflare.com/ajax/libs/d3/2.10.0/d3.v2.min.js"></script>
#  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
#</head>
#<body ng-controller="AppCtrl">
#<!-- Here's where our visualization will go -->
#<gh-visualization gh-bind="d1"></gh-visualization>
#<div ng-repeat="i in d1">
#<input type="range" max="100" min="0" step="1" ng:model="i.v"></input>
#    {{i.v}}</div>
#<script>
#  app = angular.module("myApp", []);
#
#  app.controller('AppCtrl', function ($scope) {
#    $scope.d1 = [{v: 5}, {v: 10}, {v: 70}, {v: 6}, {v: 40}, {v: 45}, {v: 80}, {v: 30}, {v: 25}];
#    $scope.d2 = [{v: 25}, {v: 0}, {v: 50}, {v: 60}, {v: 40}, {v: 5}, {v:  30}, {v: 30}, {v: 50}];
#  });
#
#  app.directive('ghVisualization', function () {
#
#    // constants
#var margin = 20,
#  width = 500,
#  height = 100 - .5 - margin;
#return {
#restrict: 'E',
#link: function (scope, element, attr) {
#// set up initial svg object
#vis = d3.selectAll(element)
#.append("svg")
#.attr("width", width)
#.attr("height", height + margin + 100)
#
#vis.selectAll().data(scope.d1).enter()
#.append("circle")
#.attr("r", 6)
#.attr("cx", function(d,i){return 60*i;})
#.attr("cy", function(d){return d.v;});
#
#scope.$watch(attr.ghBind, function(value){
#vis.selectAll("circle").data(value)
#.attr("cy", function(d){return d.v;});
#}
#, true);
#}
#}});
#
#</script>
#
#</body>
#</html>