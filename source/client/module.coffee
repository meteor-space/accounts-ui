class Space.accountsUi extends Space.ui.Module

  @publish this, 'Space.accountsUi'

  RequiredModules: [
    'Space.ui'
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
