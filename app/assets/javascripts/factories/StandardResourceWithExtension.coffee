angular.module("mi").factory 'StandardResourceWithExtension', [ 'ResourceWithExtension', '$resource', (ResourceWithExtension, $resource) ->
  class StandardResourceWithExtension extends ResourceWithExtension
    constructor: (route_key) ->
      @route_key = route_key
      @resource = $resource "#{window.root_path}#{@route_key}/:id",
        ResourceWithExtension.standard_params,
        ResourceWithExtension.standard_methods
]
