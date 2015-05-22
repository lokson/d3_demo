angular.module("mi")
.factory "User", ['$resource', 'ResourceWithExtension'
  ($resource, ResourceWithExtension) ->
    root_path = $('#root_path').html()
    resource = $resource "#{root_path}users/:id",
      { id: "@id", format: 'json' },
      {
        'update': { method: 'PUT' }
        'create': { method: 'POST' }
        'delete': { method: 'DELETE' }
      }

    new ResourceWithExtension(resource)
]