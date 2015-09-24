
Package.describe({
  name: 'space:accounts-ui',
  summary: 'Application layer foundation for accounts UI implementations.',
  version: '0.1.0',
  git: 'https://github.com/meteor-space/accounts-ui.git',
  documentation: 'README.md'
});

Package.onUse(function(api) {

  api.versionsFrom('METEOR@1.2.0.1');

  api.use([
    'coffeescript',
    'templating',
    'tracker',
    'accounts-base',
    'accounts-password',
    'space:accounts-app-service@0.1.0',
    'space:ui@5.3.0',
  ]);

  // CLIENT
  api.addFiles([
    'source/client/module.coffee',
    'source/client/events.coffee',
    // Stores
    'source/client/stores/users-store.coffee',
    'source/client/stores/current-user-store.coffee',
    // Controllers
    'source/client/controllers/account-controller.coffee',
    // Trackers
    'source/client/trackers/users-tracker.coffee',
  ], 'client');

});
