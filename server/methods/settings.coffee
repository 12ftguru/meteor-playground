Meteor.methods
  'settings/editProfile': (doc) ->
    check doc, Schemas.UserProfile
    modifier =
      "$set":
        profile: doc
    return Meteor.users.update Meteor.userId, modifier
