class Space.accountsUi.LoginController extends Space.messaging.Controller

  dependencies: {
    accounts: 'Accounts'
  }

  onDependenciesReady: ->
    @accounts.onLogin @handleSuccessfulLogin
    @accounts.onLoginFailure @handleFailedLogin

  handleFailedLogin: (login) =>
    if login.user?
      @send new Space.accounts.RegisterFailedLogin {
        targetId: new Guid(login.user._id)
        type: login.type
        error: login.error.reason
      }

  handleSuccessfulLogin: (login) =>
    @send new Space.accounts.RegisterSuccessfulLogin {
      targetId: new Guid(login.user._id)
      type: login.type
    }
