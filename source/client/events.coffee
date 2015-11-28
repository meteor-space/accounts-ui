Space.messaging.define Space.messaging.Event, 'Space.accountsUi', {

  # SIGNUP

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

  # LOGIN

  LoginRequested: {
    user: String
    password: Password
  }

  LoginInitiated: {
    user: String
  }

  LoginFailed: {
    user: String
    error: Meteor.Error
  }

  LoginSucceeded: {
    user: String
  }

  # LOGOUT

  LogoutRequested: {}

  LoggedOut: {}

}
