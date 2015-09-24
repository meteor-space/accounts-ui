{
  AccountCreationRequested
  LoginRequested
  LoginFailed
  LoginSucceeded
} = Space.accountsUi

class Space.accountsUi.AccountController extends Space.messaging.Controller

  Dependencies: {
    sha256: 'SHA256'
    meteor: 'Meteor'
  }

  @on AccountCreationRequested, (event) ->

    Space.messaging.Api.send new Space.accountsAppService.CreateUser {
      username: new Username event.username
      email: new EmailAddress event.email
      password: new Password @sha256(event.password)
    }

  @on LoginRequested, (event) ->

    @meteor.loginWithPassword event.user, event.password.toString(), (error) =>
      if error?
        @publish new LoginFailed user: event.user, error: error
      else
        @publish new LoginSucceeded user: event.user
