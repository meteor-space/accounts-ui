class Space.accountsUi extends Space.ui.Module

  @publish this, 'Space.accountsUi'

  RequiredModules: [
    'Space.ui'
    'Space.accountsApi'
  ]

  Stores: [
    'Space.accountsUi.UsersStore'
    'Space.accountsUi.CurrentUserStore'
  ]

  Controllers: [
    'Space.accountsUi.AccountController'
  ]

  Components: [
    'Space.accountsUi.AdminView'
    'Space.accountsUi.LoginView'
  ]

  Singletons: [
    'Space.accountsUi.UsersTracker'
  ]
