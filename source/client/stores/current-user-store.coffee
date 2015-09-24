{
  LoginFailed
  LoginSucceeded
  LoginRequested
  LogoutRequested
} = Space.accountsUi

class Space.accountsUi.CurrentUserStore extends Space.ui.Store

  Dependencies: {
    currentUser: 'Space.accountsAppService.CurrentUserDAO'
    meteor: 'Meteor'
    _: 'underscore'
  }

  setDefaultState: -> {
    loginError: null
  }

  setReactiveState: -> {
    userData: => @currentUser.data(),
    isLoggedIn: => @currentUser.isLoggedIn()
  }

  @on LoginRequested, -> @set 'loginError', null

  @on LoginFailed, (event) -> @set 'loginError', event.error

  @on LoginSucceeded, -> @set 'loginError', null

  @on LogoutRequested, -> @meteor.logout()
