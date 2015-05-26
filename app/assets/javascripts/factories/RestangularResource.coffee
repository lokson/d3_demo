# todo: extract ResourceWithExtension as decorator
angular.module("mi").factory 'RestangularResource', ['flash', 'Restangular', (flash, Restangular) ->
  class RestangularResource
    constructor: (resource) ->
      @resource = resource

    all: ->
      @load() if !@extension
      @extension

    load: (success, failure) ->
      @resource.getList()
        .then (res) => @extension = res
        .then null, @on_error
        .then success, failure

    # find(id: 1)
    find: (obj) ->
      for key, val of @all()
        if val.id == parseInt(obj.id)
          return { key: key, obj: val }
      { key: null, obj: null }

    # copy(id: 1)
    copy: (obj) ->
      Restangular.copy(@find(obj).obj)

    save: (obj, success, failure) ->
      @update(obj, success, failure) if obj.id
      @create(obj, success, failure) if !obj.id

    create: (obj, success, failure) ->
      @extension.post(obj)
        .then (res) => @extension.push(res)
        .then null, @on_error
        .then success, failure

    update: (obj, success, failure) ->
      obj.put()
        .then (res) =>
          key = @find(res).key
          for k of res
            @extension[key][k] = res[k]
        .then null, @on_error
        .then success, failure

    delete: (obj, success, failure) ->
      obj.remove()
        .then (res) =>
          key = @find(obj).key
          @extension.splice(key, 1)
        .then null, @on_error
        .then success, failure

    on_error: (res) => @flash(res.data)
    flash: (data) -> flash.error = error for error in data.errors.flash
]