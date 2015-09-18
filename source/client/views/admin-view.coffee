class Space.accountsUi.AdminView extends Space.ui.BlazeComponent

  @register 'space_accounts_ui_admin_view'

  Dependencies: {
    accountsStore: 'Space.accountsUi.AccountsStore'
  }

  accounts: -> @accountsStore.get 'accounts'
