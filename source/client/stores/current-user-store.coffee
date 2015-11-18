class Space.accountsUi.CurrentUserStore extends Space.flux.Store

  dependencies: {
    currentUser: 'Space.accountsUi.CurrentUserDAO'
    meteor: 'Meteor'
  }

  reactiveVars: -> [
    loginError: null
  ]

  userData: -> @currentUser.data()

  isLoggedIn: -> @currentUser.isLoggedIn()

  eventSubscriptions: -> [

    'Space.accountsUi.LoginRequested': -> @_setReactiveVar 'loginError', null

    'Space.accountsUi.LoginFailed': (event) -> @_setReactiveVar 'loginError', event.error

    'Space.accountsUi.LoginSucceeded': -> @_setReactiveVar 'loginError', null

    'Space.accountsUi.LogoutRequested': -> @meteor.logout()

  ]
