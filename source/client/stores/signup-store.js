Space.flux.Store.extend(Space.accountsUi, 'SignupStore', {

  _session: 'Space.accountsUi.SignupStore',

  eventSubscriptions() {
    return [{
      'Space.accountsUi.SignupInitiated': this._onSignupInitiated
    }];
  },

  sessionVars() {
    return [{
      signupId: null
    }];
  },

  reactiveVars() {
    return [{
      isSigningUp: false
    }];
  },

  _onSignupInitiated(event) {
    this._setSessionVar('signupId', event.signupId);
    this._setReactiveVar('isSigningUp', true);
  }

});
