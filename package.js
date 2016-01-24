
Package.describe({
  name: 'space:accounts-ui',
  summary: 'Application layer foundation for accounts UI implementations.',
  version: '0.2.0',
  git: 'https://github.com/meteor-space/accounts-ui.git',
  documentation: 'README.md'
});

Package.onUse(function(api) {

  api.versionsFrom('METEOR@1.2.0.1');

  api.use([
    'coffeescript',
    'mongo',
    'sha',
    'tracker',
    'ecmascript',
    'check',
    'accounts-base',
    'accounts-password',
    'accounts-google',
    'service-configuration',
    'space:vo-user@0.2.1',
    'space:accounts@0.1.2',
    'space:flux@0.7.0'
  ]);

  // MODULES
  api.addFiles(['source/server/module.js'], 'server');
  api.addFiles(['source/client/module.js'], 'client');

  // SHARED
  api.addFiles([
    'source/shared/collections/signups.js'
  ]);

  // CLIENT
  api.addFiles([
    'source/client/events.js',
    // Stores
    'source/client/stores/users-store.js',
    'source/client/stores/signups-store.js',
    'source/client/stores/login-store.js',
    // Controllers
    'source/client/controllers/login-controller.js',
    'source/client/controllers/signup-controller.js',
    // Trackers
    'source/client/trackers/signups-tracker.js'
  ], 'client');

  // SERVER
  api.addFiles([
    'source/server/publications/signups-publication.js'
  ], 'server');

});

Package.onTest(function(api) {

  api.use([
    'practicalmeteor:munit@2.1.4',
    'coffeescript',
    'accounts-password',
    'space:accounts-ui',
    'space:vo-user@0.2.1',
    'space:testing@2.0.1'
  ]);

});
