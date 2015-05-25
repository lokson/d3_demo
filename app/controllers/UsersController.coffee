angular.module('mi').controller 'UsersController',
  class UsersController extends ElementsController
    @$inject: ['User', '$state']
    constructor: ->
      # 3 ways to debug:
      # a. inspect in console
#      window.c = @
      # b. break in firefox
#      debugger
      # c. break in ruby files
#       byebug
      super

#    @$inject: ['User', '$state', 'Restangular']
#    constructor: (model, state, Restangular)->
#      Restangular.setDefaultRequestParams(format: 'json')
#      Restangular.all('users').getList()
#      console.log 'test'
#      super
