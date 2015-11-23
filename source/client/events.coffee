Space.messaging.define Space.messaging.Event, 'Space.accountsUi', {

  SignupRequested: {
    username: Match.OneOf(Username, null),
    email: Match.OneOf(EmailAddress, null),
    password: Match.OneOf(Password, null)
  }

  SignupInitiated: {
    signupId: Guid
  }

  SignupRetried: {
    signupId: Guid,
  }

  SignupFailed: {
    signupId: Guid,
    error: String
  }

  SignupCompleted: {
    signupId: Guid
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
