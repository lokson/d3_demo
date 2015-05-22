angular.module("mi")
.factory "Role", ['$resource', 'ResourceWithExtension'
  ($resource, ResourceWithExtension) ->
    root_path = $('#root_path').html()
    resource = $resource "#{root_path}roles/:id",
      ResourceWithExtension.standard_params,
      ResourceWithExtension.standard_methods
    new ResourceWithExtension(resource)
]