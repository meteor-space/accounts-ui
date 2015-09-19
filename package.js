Package.describe({
  name: 'space:accounts-ui',
  version: '0.1.0',
  summary: 'Admin interface for managing accounts in Space applications.',
  git: 'https://github.com/meteor-space/accounts-ui.git',
  documentation: 'README.md'
});

Package.onUse(function(api) {

  api.versionsFrom('1.0');

  api.use([
    'coffeescript',
    'templating',
    'peerlibrary:blaze-components@0.13.0',
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
    // Components
    'source/client/views/admin/admin-view.html',
    'source/client/views/admin/admin-view.coffee',
    'source/client/views/login/login-view.coffee',
    'source/client/views/login/login-view.html',
  ], 'client');

});
