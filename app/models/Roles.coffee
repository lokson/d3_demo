angular.module("d3demo").factory "Roles", ['Restangular', 'RestangularResource', (Restangular, RestangularResource) ->
  new RestangularResource(new Restangular.all 'roles')
]