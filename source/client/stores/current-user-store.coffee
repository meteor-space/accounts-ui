{ LoginFailed, LoginSucceeded, LoginRequested } = Space.accountsUi

class Space.accountsUi.CurrentUserStore extends Space.ui.Store

  Dependencies: {
    users: 'Space.accountsAppService.CurrentUserDAO'
  }

  setDefaultState: -> {
    loginError: null
  }

  setReactiveState: -> {
    isLoggedIn: => @users.isLoggedIn()
  }

  @on LoginRequested, (event) -> @set 'loginError', null

  @on LoginFailed, (event) -> @set 'loginError', event.error

  @on LoginSucceeded, (event) -> @set 'loginError', null
