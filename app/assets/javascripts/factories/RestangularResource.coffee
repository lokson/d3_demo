# todo: extract extension as decorator
# todo: extract flash as decorator
angular.module("mi").factory 'RestangularResource', ['flash', 'Restangular', (flash, Restangular) ->
  class RestangularResource
    constructor: (resource) ->
      @resource = resource

    all: ->
      @load() if !@extension
      @extension

    load: ->
      @resource.getList()
      .then (res) => @extension = res
      .then null, @on_error

    find_val_and_key: (obj) ->
      for key, val of @all()
        if val.id == parseInt(obj.id)
          return { key: key, val: val }
      { key: null, val: null }
    find_key: (obj) -> @find_val_and_key(obj).key
    # find(id: 1)
    find: (obj) -> @find_val_and_key(obj).val

    # copy(id: 1)
    copy: (obj) ->
      Restangular.copy(@find obj)

    save: (obj) ->
      if obj.id
        @update(obj)
      else
        @create(obj)

    create: (obj) ->
      @extension.customPOST(element: obj)
      .then (res) => @extension.push(res)
      .then null, @on_error

    update: (obj) ->
      # todo move from global
      params = window.reject(obj.plain(), (k,v) -> k == 'id')
      console.log params
      obj.customPUT(element: params)
      .then (res) =>
        key = @find_key(res)
        for k of res
          @extension[key][k] = res[k]
      .then null, @on_error

    delete: (obj) ->
      obj.remove()
      .then (res) =>
        key = @find_key(obj)
        @extension.splice(key, 1)
      .then null, @on_error

    on_error: (res) => @flash(res.data)
    flash: (data) -> flash.error = error for error in data.errors.flash
]