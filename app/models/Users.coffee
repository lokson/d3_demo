angular.module("app").factory "Users", ['Restangular', 'RestangularResource', (Restangular, RestangularResource) ->
  new RestangularResource(new Restangular.all 'users')
]
