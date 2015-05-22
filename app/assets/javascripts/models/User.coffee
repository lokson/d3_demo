angular.module("mi")
.factory "User", ['$resource', 'ResourceWithExtension'
  ($resource, ResourceWithExtension) ->
    root_path = $('#root_path').html()
    resource = $resource "#{root_path}users/:id",
      ResourceWithExtension.standard_params,
      ResourceWithExtension.standard_methods
    new ResourceWithExtension(resource)
]