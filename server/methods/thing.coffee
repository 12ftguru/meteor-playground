Meteor.methods
  'thing/add': (doc) ->
    check Meteor.userId(), String
    check doc, Schemas.Thing
    #throw new (Meteor.Error)('pants-not-found', 'Can\'t find my pants')
    Things.insert doc
