Space.messaging.Controller.extend(Space.accountsUi, 'LoginController', {

  dependencies: {
    meteor: 'Meteor',
    _: 'underscore'
  },

  eventSubscriptions() {
    return [{
      'Space.accountsUi.LoginRequested': this._onLoginRequested,
      'Space.accountsUi.LogoutRequested': this._onLogoutRequested,
      'Space.accountsUi.LoginWithGoogleRequested': this._onLoginWithGoogleRequested,
    }];
  },

  _onLoginRequested(event) {
    let password = event.password.toString();
    this.meteor.loginWithPassword(event.user, password, (error) => {
      if (error) {
        this.publish(new Space.accountsUi.LoginFailed({
          user: event.user,
          error: error
        }));
      } else {
        this.publish(new Space.accountsUi.LoginSucceeded({ user: event.user }));
      }
    });
    this.publish(new Space.accountsUi.LoginInitiated({ user: event.user }));
  },

  _onLogoutRequested() {
    this.meteor.logout();
    this.publish(new Space.accountsUi.LoggedOut());
  },

  _onLoginWithGoogleRequested() {
    this.meteor.loginWithGoogle({requestPermissions: ['email']}, (error) => {
      if (error) {
        let errorEvent = new Space.accountsUi.LoginWithGoogleFailed({
          error: error
        });
        this.publish(errorEvent);
      } else {
        this.publish(new Space.accountsUi.LoginWithGoogleSucceeded({}));
      }
    });
    this.publish(new Space.accountsUi.LoginWithGoogleInitiated({}));
  }

});
