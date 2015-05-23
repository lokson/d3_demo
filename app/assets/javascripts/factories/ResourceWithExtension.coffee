angular.module("mi")
.factory 'ResourceWithExtension', ['flash',
  (flash)->
    class ResourceWithExtension
      constructor: (resource) ->
        @resource = resource
        @route_key = resource.route_key

      all: ->
        if !@extension
          @extension = @resource.query()
        @extension

      find: (obj) ->
        for key, val of @all()
          if val.id == obj.id
            return { key: key, obj: val }

      save: (obj, success, failure) ->
        @update(obj, success, failure) if obj.id
        @create(obj, success, failure) if !obj.id

      create: (obj, success, failure) ->
        @resource.create(obj).$promise.then(
          (res) =>
            @extension.push(res)
            success?(res)
          (res) =>
            @flash(res.data)
            failure?(res)
        )

      update: (obj, success, failure) ->
        @resource.update(obj).$promise.then(
          (res) =>
            key = @find(res).key
            for k of res
              @extension[key][k] = res[k]
            success?(res)
          (res) =>
            @flash(res.data)
            failure?(res)
        )

      delete: (obj, success, failure) ->
        @resource.delete(id: obj.id).$promise.then(
          (res) =>
            key = @find(obj).key
            @extension.splice(key, 1)
            success?(res)
          (res) =>
            @flash(res.data)
            failure?(res)
        )

      flash: (data) ->
        flash.error = error for error in data.errors.flash

      @standard_params: { id: "@id", format: 'json' }
      @standard_methods:
        'update': { method: 'PUT' }
        'create': { method: 'POST' }
        'delete': { method: 'DELETE' }
]