angular.module("d3demo").factory "Views", ['Restangular', 'RestangularResource', (Restangular, RestangularResource) ->
  new RestangularResource(new Restangular.all 'views')
]