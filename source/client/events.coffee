Space.messaging.define Space.messaging.Event, 'Space.accountsUi', {

  AccountCreationRequested: {
    username: Username
    email: EmailAddress
    password: Password
  }

  LoginRequested: {
    user: String
    password: Password
  }

  LogoutRequested: {}

  LoginFailed: {
    user: String
    error: Meteor.Error
  }

  LoginSucceeded: {
    user: String
  }

}
