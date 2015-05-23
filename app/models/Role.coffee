angular.module("mi").factory "Role",
  ['StandardResourceWithExtension', (StandardResourceWithExtension) ->
    new StandardResourceWithExtension 'roles'
  ]