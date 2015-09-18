{ Api } = Space.messaging
{ LoginFailed, LoginSucceeded } = Space.accountsUi

class Space.accountsUi.LoginController extends Space.messaging.Controller

  Dependencies: {
    meteor: 'Meteor'
  }

  @on Space.accountsUi.LoginRequested, (event) ->

    @meteor.loginWithPassword event.user, event.password, (error) =>
      if error?
        @publish new LoginFailed user: event.user, error: error
      else
        @publish new LoginSucceeded user: event.user
