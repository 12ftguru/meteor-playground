Package.describe({
  summary: 'Template-Level Subscriptions with SubsManager.',
  version: '1.0.0',
  name: '12ftguru:subr',
  git: 'https://github.com/12ftguru/meteor-subr.git'
});

Package.on_use(function(api, where) {
  api.use([
    'coffeescript',
    'templating',
    'underscore',
    'reactive-dict',
    'reactive-var'
  ], 'client');

  api.use([
    'meteorhacks:subs-manager'
  ], ['client']);

  api.imply([
    'meteorhacks:subs-manager'
  ], ['client']);

  api.add_files([
    'lib/subr.coffee'
  ]);

  api.export('SubR', 'client');

});