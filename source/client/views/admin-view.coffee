class Space.accountsUi.AdminView extends Space.ui.BlazeComponent

  @register 'space_accounts_ui_admin_view'

  Dependencies: {
    accountsStore: 'Space.accountsUi.AccountsStore'
  }

  accounts: -> @accountsStore.get 'accounts'

  events: -> [
    'click .submit': @createAccountWithCurrentInput
  ]

  getAccountInputs: -> {
    username: @$('.create-new .username').val()
    email: @$('.create-new .email').val()
    password: @$('.create-new .password').val()
  }

  createAccountWithCurrentInput: ->
    credentials = @getAccountInputs()
    Space.messaging.Api.send new Space.accountsUi.CreateAccount(credentials)
