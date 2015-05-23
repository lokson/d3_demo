angular.module("mi")
.factory "Role", ['$resource', 'ResourceWithExtension'
  ($resource, ResourceWithExtension) ->
    route_key = 'roles'

    resource = $resource "#{window.root_path}#{route_key}/:id",
      ResourceWithExtension.standard_params,
      ResourceWithExtension.standard_methods
    resource.route_key = route_key
    new ResourceWithExtension(resource)
]