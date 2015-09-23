{ LoginFailed, LoginSucceeded, LoginRequested } = Space.accountsUi

class Space.accountsUi.CurrentUserStore extends Space.ui.Store

  Dependencies: {
    currentUser: 'Space.accountsAppService.CurrentUserDAO'
    _: 'underscore'
  }

  setDefaultState: -> {
    loginError: null
  }

  setReactiveState: -> {
    userData: => @currentUser.data(),
    isLoggedIn: => @currentUser.isLoggedIn()
  }

  @on LoginRequested, (event) -> @set 'loginError', null

  @on LoginFailed, (event) -> @set 'loginError', event.error

  @on LoginSucceeded, (event) -> @set 'loginError', null
