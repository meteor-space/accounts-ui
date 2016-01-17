Space.messaging.define(Space.messaging.Event, 'Space.accountsUi', {

  // SIGNUP

  SignupRequested: {
    username: Match.OneOf(Username, null),
    email: Match.OneOf(EmailAddress, null),
    password: Match.OneOf(Password, null)
  },

  SignupInitiated: {
    signupId: Guid
  },

  SignupRetried: {
    signupId: Guid,
  },

  SignupFailed: {
    signupId: Guid,
    error: String
  },

  SignupCompleted: {
    signupId: Guid
  },

  // LOGIN

  LoginRequested: {
    user: Match.OneOf(null, Username, EmailAddress),
    password: Match.OneOf(null, Password),
    loginType: LoginType
  },

  LoginInitiated: {
    user: Match.OneOf(null, Username, EmailAddress),
    loginType: LoginType
  },

  LoginFailed: {
    user: Match.OneOf(null, Username, EmailAddress),
    loginType: LoginType,
    error: Match.OneOf(Meteor.Error, ServiceConfiguration.ConfigError)
  },

  LoginSucceeded: {
    user: Match.OneOf(null, Username, EmailAddress),
    loginType: LoginType
  },

  // LOGOUT

  LogoutRequested: {},

  LoggedOut: {}

});

