angular.module("mi")
.factory 'ResourceWithExtension', ->
  class ResourceWithExtension
    constructor: (resource) ->
      @resource = resource

    all: ->
      if !@extension
        @extension = @resource.query()
      @extension

    find: (obj) ->
      for key, val of @all()
        if val.id == obj.id
          return { key: key, obj: val }

    save: (obj) ->
      if obj.id
        @update(obj)
      else
        @create(obj)

    create: (obj) ->
      res = @resource.create(obj)
      @extension.push(res)

    update: (obj) ->
      res = @resource.update(obj)
      key = @find(obj).key
      for k of res
        @extension[key][k] = res[k]

    delete: (obj) ->
      @resource.delete(id: obj.id)
      key = @find(obj).key
      @extension.splice(key, 1)