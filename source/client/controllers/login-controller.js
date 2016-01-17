Space.messaging.Controller.extend(Space.accountsUi, 'LoginController', {

  dependencies: {
    meteor: 'Meteor',
    _: 'underscore'
  },

  eventSubscriptions() {
    return [{
      'Space.accountsUi.LoginRequested': this._onLoginRequested,
      'Space.accountsUi.LogoutRequested': this._onLogoutRequested
    }];
  },

  _onLoginRequested(event) {

    if (!event.loginType.isService()) {
      let password = event.password.toString();
      this.meteor.loginWithPassword(event.user, password, (error) => {
        if (error) {
          this.publish(new Space.accountsUi.LoginFailed({
            user: event.user,
            error: error,
            loginType: event.loginType
          }));
        } else {
          this.publish(new Space.accountsUi.LoginSucceeded({
            user: event.user,
            loginType: event.loginType
          }));
        }
      });
      this.publish(new Space.accountsUi.LoginInitiated({
        user: event.user,
        loginType: event.loginType
      }));
    } else {
      switch(event.loginType.loginType) {
        case 'google':
          this.meteor.loginWithGoogle({requestPermissions: ['email']}, (error) => {
            if (error) {
              let errorEvent = new Space.accountsUi.LoginFailed({
                error: error,
                loginType: event.loginType
              });
              this.publish(errorEvent);
            } else {
              this.publish(new Space.accountsUi.LoginSucceeded({
                loginType: event.loginType
              }));
            }
          });
          this.publish(new Space.accountsUi.LoginInitiated({
            loginType: event.loginType
          }));
        break;
        case 'facebook':
          this.meteor.loginWithFacebook({requestPermissions: ['email', 'public_profile']}, (error) => {
            if (error) {
              let errorEvent = new Space.accountsUi.LoginFailed({
                error: error,
                loginType: event.loginType
              });
              this.publish(errorEvent);
            } else {
              this.publish(new Space.accountsUi.LoginSucceeded({
                loginType: event.loginType
              }));
            }
          });
          this.publish(new Space.accountsUi.LoginInitiated({
            loginType: event.loginType
          }));
          break;
      }
    }

  },

  _onLogoutRequested() {
    this.meteor.logout();
    this.publish(new Space.accountsUi.LoggedOut());
  }

});
