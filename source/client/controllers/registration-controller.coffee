class Space.accountsUi.RegistrationController extends Space.messaging.Controller

  Dependencies: {
    sha256: 'SHA256'
  }

  @on Space.accountsUi.AccountCreationRequested, (event) ->

    Space.messaging.Api.send new Space.accountsUi.CreateUser {
      username: event.username
      email: event.email
      password: @sha256(event.password)
    }
