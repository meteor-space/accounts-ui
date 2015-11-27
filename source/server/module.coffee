class Space.accountsUi extends Space.Module

  @publish this, 'Space.accountsUi'

  requiredModules: [
    'Space.accounts'
  ]

  singletons: [
    'Space.accountsUi.SignupsPublication'
    'Space.accountsUi.UsersPublication'
  ]

  onInitialize: ->
    @injector.map('SHA256').to SHA256
    @injector.map('Meteor.user').to Meteor.user
    @injector.map('Meteor.users').to Meteor.users
    @injector.map('Space.accountsUi.Signups').asStaticValue()
