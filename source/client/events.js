Space.messaging.define(Space.messaging.Event, 'Space.accountsUi', {

  // SIGNUP

  SignupRequested: {
    username: Match.Optional(Username),
    email: Match.Optional(EmailAddress),
    password: Match.Optional(Password),
    loginType: LoginType
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
    user: Match.Optional(Match.OneOf(Username, EmailAddress)),
    password: Match.Optional(Password),
    loginType: LoginType
  },

  LoginInitiated: {
    user: Match.Optional(Match.OneOf(Username, EmailAddress)),
    loginType: LoginType
  },

  LoginFailed: {
    user: Match.Optional(Match.OneOf(Username, EmailAddress)),
    loginType: LoginType,
    error: Match.OneOf(Meteor.Error, ServiceConfiguration.ConfigError)
  },

  LoginSucceeded: {
    user: Match.Optional(Match.OneOf(Username, EmailAddress)),
    loginType: LoginType
  },

  // LOGOUT

  LogoutRequested: {},

  LoggedOut: {}

});

