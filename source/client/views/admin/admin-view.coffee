class Space.accountsUi.AdminView extends Space.ui.BlazeComponent

  @register 'space_accounts_ui_admin_view'

  Dependencies: {
    usersStore: 'Space.accountsUi.UsersStore'
  }

  accounts: -> @usersStore.get 'accounts'

  events: -> [
    'click .submit': @requestAccountRegistration
  ]

  getCredentials: -> {
    username: @$('.create-new .username').val()
    email: @$('.create-new .email').val()
    password: @$('.create-new .password').val()
  }

  requestAccountRegistration: ->
    credentials = @getCredentials()
    @publish new Space.accountsUi.AccountCreationRequested(credentials)
