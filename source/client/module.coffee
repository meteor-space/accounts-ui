Space.accountsUi = Space.Module.define 'Space.accountsUi',

  requiredModules: [
    'Space.flux'
  ]

  stores: [
    'Space.accountsUi.SignupsStore',
    'Space.accountsUi.LoginStore'
    'Space.accountsUi.UsersStore'
  ]

  controllers: [
    'Space.accountsUi.LoginController'
  ]

  singletons: [
    'Space.accountsUi.SignupsTracker'
  ]

  onInitialize: ->
    @injector.map('SHA256').to SHA256
    @injector.map('Meteor.user').to Meteor.user
    @injector.map('Meteor.users').to Meteor.users
    @injector.map('Space.accountsUi.Signups').asStaticValue()
