angular.module('app').controller 'UsersController',
  class UsersController extends ElementsController
    @$inject: ['Users', '$state']
    constructor: ->
      super