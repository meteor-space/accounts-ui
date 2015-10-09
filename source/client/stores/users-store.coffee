class Space.accountsUi.UsersStore extends Space.ui.Store

  Dependencies: {
    users: 'Space.accountsUi.UsersDAO'
  }

  accounts: -> @users.all()
