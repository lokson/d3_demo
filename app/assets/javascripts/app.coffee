mi = angular.module 'mi', [
  'ngRoute'
  'ngResource'
  'ngAnimate'
  'ui.router'
  'controllers'
  'angular-flash.service'
  'angular-flash.flash-alert-directive'
  'restangular'
]

mi.config ['flashProvider', '$stateProvider', '$urlRouterProvider', 'RestangularProvider'
  (flashProvider, $stateProvider, $urlRouterProvider, RestangularProvider) ->
    flashProvider.errorClassnames.push 'alert-danger'
    flashProvider.warnClassnames.push 'alert-warning'
    flashProvider.infoClassnames.push 'alert-info'
    flashProvider.successClassnames.push 'alert-success'

    root_path = window.root_path

    RestangularProvider.setDefaultRequestParams(format: 'json')
    RestangularProvider.setBaseUrl(root_path)

    $urlRouterProvider.otherwise("/users");
    $stateProvider
      .state('users',
        url: '/users'
        templateUrl: "#{root_path}users"

      ).state('users.new',
        url: '/new'
        templateUrl: "#{root_path}users/new"

      ).state('users.edit',
        url: '/:id/edit'
        templateUrl: (params) -> "#{root_path}users/#{params.id}/edit"

      ).state('roles',
        url: '/roles'
        templateUrl: "#{root_path}roles"

      ).state('roles.new',
        url: '/new'
        templateUrl: "#{root_path}roles/new"

      ).state('roles.edit',
        url: '/:id/edit'
        templateUrl: (params) -> "#{root_path}roles/#{params.id}/edit"

      )
]

controllers = angular.module 'controllers', []