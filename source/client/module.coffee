class Space.accountsUi extends Space.flux.Module

  @publish this, 'Space.accountsUi'

  RequiredModules: [
    'Space.flux'
  ]

  Stores: [
    'Space.accountsUi.UsersStore'
    'Space.accountsUi.CurrentUserStore'
  ]

  Controllers: [
    'Space.accountsUi.AccountController'
  ]

  Singletons: [
    'Space.accountsUi.UsersTracker'
  ]

  configure: ->
    @injector.map('SHA256').to SHA256
    @injector.map('Meteor.user').to Meteor.user
    @injector.map('Meteor.users').to Meteor.users
