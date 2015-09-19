class Space.accountsUi.UsersStore extends Space.ui.Store

  Dependencies: {
    users: 'Space.accountsAppService.UsersDAO'
  }

  setDefaultState: -> {
    accounts: @users.all()
  }
