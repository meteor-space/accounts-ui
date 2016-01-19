Space.messaging.Publication.extend('Space.accountsUi.SignupsPublication', {

  dependencies: {
    signups: 'Space.accountsUi.Signups'
  },

  publications() {
    return [{
      'signup-by-id'(context, id) {
        return this.signups.find(id);
      }
    }];
  }

});
