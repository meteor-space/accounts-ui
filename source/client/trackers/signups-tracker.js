Space.messaging.Tracker.extend('Space.accountsUi.SignupsTracker', {

  dependencies: {
    store: 'Space.accountsUi.SignupsStore'
  },

  autorun() {
    this.meteor.subscribe('signup-by-id', this.store.signupId());
  }

});
