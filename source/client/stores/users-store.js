Space.flux.Store.extend('Space.accountsUi.UsersStore', {

  dependencies: {
    meteor: 'Meteor'
  },

  accounts() {
    return this.meteor.users();
  },

  reactiveVars() {
    return [{
      isLoggedIn: false,
      user: null,
      userId: null
    }];
  },

  computations() {
    return [this._updateUserState];
  },

  _updateUserState() {
    let user = this.meteor.user();
    let isLoggedIn = user !== null && user !== undefined;
    this._setReactiveVar('isLoggedIn', isLoggedIn);
    this._setReactiveVar('user', user);
    this._setReactiveVar('userId', isLoggedIn ? user._id : null);
  }
});
