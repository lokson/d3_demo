angular.module("mi")
.factory "Role", ['$resource',
  ($resource) ->
    root_path = $('#root_path').html()
    resource = $resource "#{root_path}roles/:id",
      { id: "@id", format: 'json' },
      {
        'update': { method: 'PUT' }
        'create': { method: 'POST' }
        'delete': { method: 'DELETE' }
      }

    # Role.all returns array with methods
    # which equals to extension with crud operations
    resource.all = ->
      if !resource.extension
        resource.extension = resource.query()

        resource.extension.find = (obj) ->
          for k,v of resource.extension
            if v.id == obj.id
              return { key: k, obj: obj }

        resource.extension.save = (obj) ->
          if obj.id?
            resource.extension.update(obj)
          else
            resource.extension.create(obj)

        resource.extension.create = (obj) ->
          resource.extension.push(resource.create obj)

        resource.extension.update = (obj) ->
          key = resource.extension.find(obj).key
          res = resource.update(obj)
          for k of res
            resource.extension[key][k] = res[k]

        resource.extension.delete = (obj) ->
          key = resource.extension.find(obj).key
          resource.extension.splice(key,1)
          resource.delete(id: obj.id)

      resource.extension

    resource
]