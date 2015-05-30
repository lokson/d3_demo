angular.module('d3demo').controller 'UsersController',
  class UsersController extends ElementsController
    @$inject: ['Users', '$state']
    # debug demo
    constructor: ->
      # 3 ways to debug:
      # a. inspect in console
#      window.c = @
      # b. break in firefox
#      debugger
      # c. break in ruby files
#      byebug
      super