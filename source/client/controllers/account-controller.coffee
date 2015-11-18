class Space.accountsUi.AccountController extends Space.messaging.Controller

  dependencies: {
    sha256: 'SHA256'
    meteor: 'Meteor'
  }

  eventSubscriptions: -> [

    'Space.accountsUi.AccountCreationRequested': (event) ->
      Space.messaging.Api.send new Space.accountsUi.CreateUser {
        username: new Username event.username
        email: new EmailAddress event.email
        password: new Password @sha256(event.password)
      }

    'Space.accountsUi.LoginRequested': (event) ->
      @meteor.loginWithPassword event.user, event.password.toString(), (error) =>
        if error?
          @publish new Space.accountsUi.LoginFailed user: event.user, error: error
        else
          @publish new Space.accountsUi.LoginSucceeded user: event.user
  ]
