class Space.accountsUi.UsersStore extends Space.flux.Store

  dependencies: {
    users: 'Space.accountsUi.UsersDAO'
  }

  accounts: -> @users.all()
