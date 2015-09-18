class Space.accountsUi.LoginView extends Space.ui.BlazeComponent

  @register 'space_accounts_ui_login_view'

  Dependencies: {
    currentUserStore: 'Space.accountsUi.CurrentUserStore'
  }

  loginError: -> @currentUserStore.get 'loginError'

  events: -> [
    'click .submit': @login
  ]

  getCredentials: -> {
    user: @$('.login-view .user').val()
    password: @$('.login-view .password').val()
  }

  login: -> @publish new Space.accountsUi.LoginRequested(@getCredentials())
