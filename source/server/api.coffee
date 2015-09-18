class Space.accountsUi.Api extends Space.messaging.Api

  Dependencies: {
    _: 'underscore'
  }

  @method Space.accountsUi.CreateAccount, (context, credentials) ->

    # TODO: Check that user has the rights to do that

    # Tell the accounts package to register an account
    @commandBus.send new Space.accounts.Register @_.extend {}, credentials, {
      targetId: new Guid()
    }
