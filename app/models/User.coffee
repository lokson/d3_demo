angular.module("mi").factory "User",
  ['StandardResourceWithExtension', (StandardResourceWithExtension) ->
    new StandardResourceWithExtension 'users'
  ]
