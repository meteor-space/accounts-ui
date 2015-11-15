class Space.accountsUi.UsersPublication extends Space.messaging.Publication

  dependencies: {
    users: 'Space.accountsUi.UsersDAO'
  }

  @publish 'all-users', (context) -> @users.all() if context.userId?
