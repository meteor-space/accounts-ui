Space.messaging.Controller.extend(Space.accountsUi, 'SignupController', {

  dependencies: {
    sha256: 'SHA256',
    meteor: 'Meteor',
    signupsStore: 'Space.accountsUi.SignupsStore',
    log: 'log'
  },

  requestSignupEvent: 'Space.accountsUi.SignupRequested',
  initiateSignupCommand: 'Space.accounts.InitiateSignup',

  onDependenciesReady() {
    Space.messaging.Controller.prototype.onDependenciesReady.call(this);
    // Bind the response handler to this instance
    this._handleSignupResponse = _.bind(this._handleSignupResponse, this);
  },

  eventSubscriptions() {
    subscribers = {};
    // Subscribe to the configured signup-request event
    subscribers[this.requestSignupEvent] = this._onSignupRequested;
    return [subscribers];
  },

  _onSignupRequested(event) {
    this.log.info(`${this}: received signup request <${event}>`);
    // Extract all properties from the event but omit default stuff we dont need
    let data = _.omit(event.toPlainObject(), 'eventVersion', 'timestamp');
    if (data.password) {
      // Never send passwords in plain text over the wire
      data.password = new Password(this.sha256(data.password.toString()));
    }
    // Initiate a new signup process
    let signupId = new Guid();
    // Resolve the configured command that should be used
    let InitiateCommand = Space.resolvePath(this.initiateSignupCommand);
    signupCommand = new InitiateCommand(_.extend(data, { targetId: signupId }));
    this.log.info(`${this}: initiating signup with <${signupCommand}>`);
    // Send the command to the server where it should be handled by an api
    this.send(signupCommand, this._handleSignupResponse);
    this.publish(new Space.accountsUi.SignupInitiated({ signupId: signupId }));
  },

  _handleSignupResponse(error) {
    let signupId = new Guid(this.signupsStore.signupId());
    if (error) {
      this.log.info(`${this}: error on signup ${error}`);
      this.publish(new Space.accountsUi.SignupFailed({
        signupId: signupId,
        error: error
      }));
    } else {
      this.log.info(`${this}: signup <${signupId}> completed`);
      this.publish(new Space.accountsUi.SignupCompleted({ signupId: signupId }));
    }
  }
});
