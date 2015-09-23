Space.messaging.define Space.messaging.Event, 'Space.accountsUi', {

  AccountCreationRequested: {
    username: String
    email: String
    password: String
  }

  LoginRequested: {
    user: String
    password: String
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
