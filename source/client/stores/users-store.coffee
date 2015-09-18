class Space.accountsUi.UsersStore extends Space.ui.Store

  Dependencies: {
    users: 'Space.accountsApi.UsersDAO'
  }

  setDefaultState: -> {
    accounts: @users.all()
  }
