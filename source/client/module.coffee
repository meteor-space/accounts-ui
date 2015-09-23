class Space.accountsUi extends Space.ui.Module

  @publish this, 'Space.accountsUi'

  RequiredModules: [
    'Space.ui'
    'Space.accountsAppService'
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
