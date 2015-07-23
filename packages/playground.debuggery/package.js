Package.describe({
  summary: 'Various Debugging Tools for Playground.',
  version: '1.0.0',
  name: 'playground:debuggery',
  git: 'https://github.com/12ftguru/meteor-playground.git'
});

Package.on_use(function(api, where) {
  api.versionsFrom('METEOR@1.0');

  api.use([
    'coffeescript',
    'templating'
  ], 'client');
  api.add_files([
    'template.coffee'
  ], ['client']);
});

/* 
Package.on_test(function(api) {
  api.use([
    'playground:useraccounts',
    'useraccounts:core@1.11.1'
  ]);

  api.use([
    'accounts-password',
    'tinytest',
    'test-helpers'
  ], ['client', 'server']);

  api.add_files([
    'tests/tests.js'
  ], ['client', 'server']);
}); */