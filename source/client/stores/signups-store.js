Space.flux.Store.extend('Space.accountsUi.SignupsStore', {

  dependencies: {
    signups: 'Space.accountsUi.Signups',
    config: 'configuration'
  },

  _session: 'Space.accountsUi.SignupStore',

  eventSubscriptions() {
    return [{
      'Space.accountsUi.SignupInitiated': this._onSignupInitiated,
      'Space.accountsUi.SignupCompleted': this._onSignupCompleted,
      'Space.accountsUi.SignupFailed': this._onSignupFailed
    }];
  },

  sessionVars() {
    return [{
      signupId: null
    }];
  },

  reactiveVars() {
    return [{
      signup: null,
      isSigningUp: false
    }];
  },

  computations() {
    return [
      this._updateSignupState
    ];
  },

  _onSignupInitiated(event) {
    this._setSessionVar('signupId', event.signupId.toString());
    this._setSessionVar('isSigningUp', true);
  },

  _onSignupCompleted() {
    this._setSessionVar('isSigningUp', false);
  },

  _onSignupFailed() {
    this._setSessionVar('isSigningUp', false);
  },

  _updateSignupState() {
    this._setReactiveVar('signup', this.signups.findOne(this.signupId()));
  }
});
