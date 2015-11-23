Space.messaging.Controller.extend(Space.accountsUi, 'SignupController', {

  dependencies: {
    configuration: 'configuration',
    sha256: 'SHA256',
    meteor: 'Meteor',
    signUpStore: 'Space.accountsUi.SignupStore'
  },

  onDependenciesReady() {
    Space.messaging.Controller.prototype.onDependenciesReady.call(this);
    // Bind the response handler to this instance
    this._handleSignupResponse = _.bind(this._handleSignupResponse, this);
  },

  eventSubscriptions() {
    subscribers = {};
    requestEvent = this.configuration.accountsUi.requestSignupEvent;
    subscribers[requestEvent] = this._onSignupRequested;
    return [subscribers];
  },

  _onSignupRequested(event) {
    let data = _.omit(event.toPlainObject(), 'eventVersion', 'timestamp');
    let config = this.configuration.accountsUi;
    if (data.password) {
      data.password = new Password(this.sha256(data.password.toString()));
    }
    if (this.signUpStore.isSigningUp()) {
      // Retry previously initiated signup
      let signupId = this.signUpStore.signupId();
      let RetryCommand = Space.resolvePath(config.retrySignupCommand);
      signupCommand = new RetryCommand(_.extend(data, {
        targetId: signupId
      }));
      this.send(signupCommand, this._handleSignupResponse);
      this.publish(new Space.accountsUi.SignupRetried({ signupId: signupId }));
    } else {
      // Initiate a new signup process
      let signupId = new Guid();
      let InitiateCommand = Space.resolvePath(config.initiateSignupCommand);
      signupCommand = new InitiateCommand(_.extend(data, {
        targetId: signupId
      }));
      this.send(signupCommand, this._handleSignupResponse);
      this.publish(new Space.accountsUi.SignupInitiated({ signupId: signupId }));
    }
  },

  _handleSignupResponse(error) {
    console.log(error);
  }
});
