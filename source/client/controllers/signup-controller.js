Space.messaging.Controller.extend(Space.accountsUi, 'SignupController', {

  dependencies: {
    configuration: 'configuration',
    sha256: 'SHA256',
    meteor: 'Meteor',
    signupsStore: 'Space.accountsUi.SignupsStore',
    log: 'log'
  },

  onDependenciesReady() {
    Space.messaging.Controller.prototype.onDependenciesReady.call(this);
    // Bind the response handler to this instance
    this._handleSignupResponse = _.bind(this._handleSignupResponse, this);
  },

  eventSubscriptions() {
    subscribers = {};
    // Subscribe to the configured signup-request event
    requestEvent = this.configuration.accountsUi.requestSignupEvent;
    subscribers[requestEvent] = this._onSignupRequested;
    return [subscribers];
  },

  _onSignupRequested(event) {
    this.log.info(`${this}: received signup request <${event}>`);
    // Extract all properties from the event but omit default stuff we dont need
    let data = _.omit(event.toPlainObject(), 'eventVersion', 'timestamp');
    let config = this.configuration.accountsUi;
    if (data.password) {
      // Never send passwords in plain text over the wire
      data.password = new Password(this.sha256(data.password.toString()));
    }
    if (this.signupsStore.signupId()) {
      // Retry previously initiated signup
      let signupId = new Guid(this.signupsStore.signupId());
      // Resolve the configured command that should be used
      let RetryCommand = Space.resolvePath(config.retrySignupCommand);
      signupCommand = new RetryCommand(_.extend(data, { targetId: signupId }));
      this.log.info(`${this}: retrying signup with <${signupCommand}>`);
      // Send the command to the server where it should be handled by an api
      this.send(signupCommand, this._handleSignupResponse);
      this.publish(new Space.accountsUi.SignupRetried({ signupId: signupId }));
    } else {
      // Initiate a new signup process
      let signupId = new Guid();
      // Resolve the configured command that should be used
      let InitiateCommand = Space.resolvePath(config.initiateSignupCommand);
      signupCommand = new InitiateCommand(_.extend(data, { targetId: signupId }));
      this.log.info(`${this}: initiating signup with <${signupCommand}>`);
      // Send the command to the server where it should be handled by an api
      this.send(signupCommand, this._handleSignupResponse);
      this.publish(new Space.accountsUi.SignupInitiated({ signupId: signupId }));
    }
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