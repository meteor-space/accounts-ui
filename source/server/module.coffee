class Space.accountsUi extends Space.Module

  @publish this, 'Space.accountsUi'

  requiredModules: [
    'Space.accounts'
  ]

  singletons: [
    'Space.accountsUi.Api'
    'Space.accountsUi.LoginController'
    'Space.accountsUi.UsersProjection'
    'Space.accountsUi.UsersPublication'
  ]

  configure: ->
    @injector.map('SHA256').to SHA256
    @injector.map('Meteor.user').to Meteor.user
    @injector.map('Meteor.users').to Meteor.users
