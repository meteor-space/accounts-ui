{
  LoginFailed
  LoginSucceeded
  LoginRequested
  LogoutRequested
} = Space.accountsUi

class Space.accountsUi.CurrentUserStore extends Space.flux.Store

  Dependencies: {
    currentUser: 'Space.accountsUi.CurrentUserDAO'
    meteor: 'Meteor'
    _: 'underscore'
  }

  reactiveVars: -> [
    loginError: null
  ]

  userData: -> @currentUser.data(),

  isLoggedIn: -> @currentUser.isLoggedIn()

  @on LoginRequested, -> @_setReactiveVar 'loginError', null

  @on LoginFailed, (event) -> @_setReactiveVar 'loginError', event.error

  @on LoginSucceeded, -> @_setReactiveVar 'loginError', null

  @on LogoutRequested, -> @meteor.logout()
