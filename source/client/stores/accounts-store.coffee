class Space.accountsUi.AccountsStore extends Space.ui.Store

  Dependencies: {
    meteorUsers: 'Space.accounts.MeteorUsersDAO'
  }

  setDefaultState: -> {
    accounts: @meteorUsers.all()
  }
