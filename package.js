
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
    'templating',
    'tracker',
    'ecmascript',
    'check',
    'accounts-base',
    'accounts-password',
    'space:vo-user@0.2.1',
    'space:accounts@0.1.2',
    'space:flux@0.6.0'
  ]);

  // MODULES
  api.addFiles(['source/server/module.coffee'], 'server');
  api.addFiles(['source/client/module.coffee'], 'client');

  // SHARED
  api.addFiles([
    'source/shared/dao/users-dao.coffee'
  ]);

  // CLIENT
  api.addFiles([
    'source/client/events.coffee',
    'source/client/dao/current-user-dao.coffee',
    // Stores
    'source/client/stores/users-store.coffee',
    'source/client/stores/current-user-store.coffee',
    'source/client/stores/signup-store.js',
    // Controllers
    'source/client/controllers/login-controller.js',
    'source/client/controllers/signup-controller.js',
    // Trackers
    'source/client/trackers/users-tracker.coffee'
  ], 'client');

  // SERVER
  api.addFiles([
    'source/server/publications/users-publication.coffee'
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

  api.addFiles([
    'tests/test-app.coffee',
    'tests/fixtures.coffee',
    'tests/unit/users-dao.unit.coffee',
    'tests/unit/current-user-dao.unit.coffee'
  ], ['client', 'server']);

});
