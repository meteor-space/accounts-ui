Space.flux.Store.extend(Space.accountsUi, 'LoginStore', {

  eventSubscriptions() {
    return [{
      'Space.accountsUi.LoginInitiated': this._onLoginInitiated,
      'Space.accountsUi.LoginSucceeded': this._onLoginSucceeded,
      'Space.accountsUi.LoginFailed': this._onLoginFailed,
      'Space.accountsUi.LogoutRequested': this._onLogoutRequested
    }];
  },

  reactiveVars() {
    return [{
      isLoggingIn: false,
      error: null
    }];
  },

  _onLoginInitiated() {
    this._setSessionVar('isLoggingIn', true);
  },

  _onLoginSucceeded() {
    this._setSessionVar('isLoggingIn', false);
    this._setSessionVar('error', null);
  },

  _onLoginFailed(event) {
    this._setSessionVar('isLoggingIn', false);
    this._setSessionVar('error', event.error);
  },

  _onLogoutRequested() {
    this.meteor.logout();
  }

});
