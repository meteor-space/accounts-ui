class Space.accountsUi.Api extends Space.messaging.Api

  Dependencies: {
    meteor: 'Meteor'
  }

  @method Space.accountsUi.CreateUser, (context, command) ->
    if not context.userId?
      throw new Meteor.Error 'You are not allowed to create users.'
      
    # Tell the accounts package to register an account
    @commandBus.send new Space.accounts.CreateUser {
      targetId: new Guid()
      username: command.username
      email: command.email
      password: command.password
    }
