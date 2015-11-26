Space.messaging.Publication.extend(Space.accountsUi, 'UsersPublication', {

  dependencies: {
    users: 'Space.accountsUi.UsersDAO'
  },

  publications() {
    return [{
      'all-users'(context) {
        if (context.userId) return this.users.all();
      }
    }];
  }
});
