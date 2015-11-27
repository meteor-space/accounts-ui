Space.accountsUi = Space.Module.define 'Space.accountsUi',

  configuration: {
    accountsUi: {
      requestSignupEvent: 'Space.accountsUi.SignupRequested',
      initiateSignupCommand: 'Space.accounts.InitiateSignup'
      retrySignupCommand: 'Space.accounts.RetrySignup'
    }
  }

  requiredModules: [
    'Space.flux'
  ]

  stores: [
    'Space.accountsUi.SignupsStore',
    'Space.accountsUi.LoginStore'
    'Space.accountsUi.UsersStore'
  ]

  controllers: [
    'Space.accountsUi.SignupController',
    'Space.accountsUi.LoginController'
  ]

  singletons: [
    'Space.accountsUi.UsersTracker'
    'Space.accountsUi.SignupsTracker'
    'Space.accountsUi.CurrentUserDAO',
    'Space.accountsUi.UsersDAO'
  ]

  onInitialize: ->
    @injector.map('SHA256').to SHA256
    @injector.map('Meteor.user').to Meteor.user
    @injector.map('Meteor.users').to Meteor.users
    @injector.map('Space.accountsUi.Signups').asStaticValue()
