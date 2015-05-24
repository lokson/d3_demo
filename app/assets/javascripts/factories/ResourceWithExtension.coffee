angular.module("mi")
.factory 'ResourceWithExtension', ['flash',
  (flash)->
    class ResourceWithExtension
      constructor: (resource) ->
        @resource = resource
        @route_key = resource.route_key

      all: ->
        @load() if !@extension
        # todo: load() is asynchronous and results will not be ready,
        # check "return" in callback or look for synchronous version
        @extension

      # find(id: 1)
      find: (obj) ->
        for key, val of @all()
          if val.id == parseInt(obj.id)
            return { key: key, obj: val }
        { key: null, obj: null }

      # copy(id: 1)
      copy: (obj) ->
        angular.copy(@find(obj).obj)

      load: (success, failure) ->
        p = @resource.query().$promise
        p.then (res) => @extension = res
        p.then null, @on_error
        p.then success, failure

      save: (obj, success, failure) ->
        @update(obj, success, failure) if obj.id
        @create(obj, success, failure) if !obj.id

      create: (obj, success, failure) ->
        p = @resource.create(obj).$promise
        p.then (res) => @extension.push(res)
        p.then null, @on_error
        p.then success, failure

      update: (obj, success, failure) ->
        p = @resource.update(obj).$promise
        p.then (res) =>
          key = @find(res).key
          for k of res
            @extension[key][k] = res[k]
        p.then null, @on_error
        p.then success, failure

      delete: (obj, success, failure) ->
        p = @resource.delete(id: obj.id).$promise
        p.then (res) =>
          key = @find(obj).key
          @extension.splice(key, 1)
        p.then null, @on_error
        p.then success, failure

      on_error: (res) => @flash(res.data)
      flash: (data) -> flash.error = error for error in data.errors.flash

      @standard_params: { id: "@id", format: 'json' }
      @standard_methods:
        'update': { method: 'PUT' }
        'create': { method: 'POST' }
        'delete': { method: 'DELETE' }
]