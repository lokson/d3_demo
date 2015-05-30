angular.module("app").factory "Views", ['Restangular', 'RestangularResource', (Restangular, RestangularResource) ->
  new RestangularResource(new Restangular.all 'views')
]