angular.module("app").factory "Roles", ['Restangular', 'RestangularResource', (Restangular, RestangularResource) ->
  new RestangularResource(new Restangular.all 'roles')
]