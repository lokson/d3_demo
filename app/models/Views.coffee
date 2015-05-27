angular.module("mi").factory "Views", ['Restangular', 'RestangularResource', (Restangular, RestangularResource) ->
  new RestangularResource(new Restangular.all 'views')
]