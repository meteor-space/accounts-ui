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
    this._setReactiveVar('isLoggingIn', true);
  },

  _onLoginSucceeded() {
    this._setReactiveVar('isLoggingIn', false);
    this._setReactiveVar('error', null);
  },

  _onLoginFailed(event) {
    this._setReactiveVar('isLoggingIn', false);
    this._setReactiveVar('error', event.error);
  },

  _onLogoutRequested() {
    this.meteor.logout();
  }

});
