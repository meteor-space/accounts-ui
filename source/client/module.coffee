class Space.accountsUi extends Space.ui.Module

  @publish this, 'Space.accountsUi'

  RequiredModules: [
    'Space.ui'
    'Space.accounts'
  ]

  Stores: [
    'Space.accountsUi.AccountsStore'
  ]

  Components: [
    'Space.accountsUi.AdminView'
  ]
