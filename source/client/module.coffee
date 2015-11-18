class Space.accountsUi extends Space.flux.Module

  @publish this, 'Space.accountsUi'

  requiredModules: [
    'Space.flux'
  ]

  stores: [
    'Space.accountsUi.UsersStore'
    'Space.accountsUi.CurrentUserStore'
  ]

  controllers: [
    'Space.accountsUi.AccountController'
  ]

  singletons: [
    'Space.accountsUi.UsersTracker'
    'Space.accountsUi.CurrentUserDAO'
  ]

  configure: ->
    @injector.map('SHA256').to SHA256
    @injector.map('Meteor.user').to Meteor.user
    @injector.map('Meteor.users').to Meteor.users
