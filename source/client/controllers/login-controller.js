Space.messaging.Controller.extend(Space.accountsUi, 'LoginController', {

  dependencies: {
    meteor: 'Meteor',
    _: 'underscore'
  },

  onDependenciesReady() {
    // Bind the response handler to this instance
    this._handleLoginResponse = this._.bind(this._handleLoginResponse, this);
  },

  eventSubscriptions() {
    return [{
      'Space.accountsUi.LoginRequested': this._onLoginRequested
    }];
  },

  _onLoginRequested(event) {
    let password = event.password.toString();
    this.meteor.loginWithPassword(event.user, password, this._handleLoginResponse);
  },

  _handleLoginResponse(error) {
    if (error) {
      this.publish(new Space.accountsUi.LoginFailed({
        user: event.user,
        error: error
      }));
    } else {
      this.publish(new Space.accountsUi.LoginSucceeded({ user: event.user }));
    }
  }
});
