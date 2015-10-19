class Space.accountsUi.UsersStore extends Space.flux.Store

  Dependencies: {
    users: 'Space.accountsUi.UsersDAO'
  }

  accounts: -> @users.all()
