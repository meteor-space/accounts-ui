Space.accountsUi = Space.Module.define('Space.accountsUi', {

  requiredModules: [
    'Space.flux'
  ],

  stores: [
    'Space.accountsUi.SignupsStore',
    'Space.accountsUi.LoginStore',
    'Space.accountsUi.UsersStore'
  ],

  controllers: [
    'Space.accountsUi.LoginController'
  ],

  singletons: [
    'Space.accountsUi.SignupsTracker'
  ],

  onInitialize() {
    this.injector.map('SHA256').to(SHA256);
    this.injector.map('Meteor.user').to(Meteor.user);
    this.injector.map('Meteor.users').to(Meteor.users);
    this.injector.map('Space.accountsUi.Signups').asStaticValue();
  }

});
