class Space.accountsUi.CurrentUserStore extends Space.flux.Store

  dependencies: {
    meteor: 'Meteor'
  }

  reactiveVars: -> [
    loginError: null,
    isLoggedIn: false,
    data: null,
    userId: null
  ]

  computations: -> [this._updateUserState]

  eventSubscriptions: -> [

    'Space.accountsUi.LoginRequested': -> @_setReactiveVar 'loginError', null

    'Space.accountsUi.LoginFailed': (event) -> @_setReactiveVar 'loginError', event.error

    'Space.accountsUi.LoginSucceeded': -> @_setReactiveVar 'loginError', null

    'Space.accountsUi.LogoutRequested': -> @meteor.logout()

  ]

  _updateUserState: ->
    user = @meteor.user()
    @_setReactiveVar 'isLoggedIn', user?
    @_setReactiveVar 'data', user
    @_setReactiveVar 'userId', user?._id
