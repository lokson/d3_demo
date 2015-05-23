angular.module("mi")
.factory "User", ['$resource', 'ResourceWithExtension'
  ($resource, ResourceWithExtension) ->
    route_key = 'users'

    root_path = $('#root_path').html()
    resource = $resource "#{root_path}#{route_key}/:id",
      ResourceWithExtension.standard_params,
      ResourceWithExtension.standard_methods
    resource.route_key = route_key
    new ResourceWithExtension(resource)
]