angular.module('mi').controller 'UsersController',
  class UsersController extends window.ElementsController
    @$inject: ['User', '$scope', '$state']
