Space.messaging.Publication.extend(Space.accountsUi, 'UsersPublication', {

  dependencies: {
    meteor: 'Meteor'
  },

  publications() {
    return [{
      'all-users'(context) {
        if (context.userId) return this.meteor.users();
      }
    }];
  }
});
