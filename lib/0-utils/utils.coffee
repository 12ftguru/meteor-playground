@Utils =
  prettyUserName: (user) ->
    if user.profile?.firstName?
      if user.profile?.lastName?
        if user.profile?.secondName?
          return user.profile.firstName + ' ' + user.profile.secondName + ' ' +  user.profile.lastName
        else
          return user.profile.firstName + ' ' + user.profile.lastName
      else
        return user.profile.firstName
    else if user.username?
      return user.username
    else
      return user.emails[0].address

  isOwnerOrAdmin: (user_id, doc) ->
    if user_id is doc.createdBy
      return true
    else
      return Roles.userIsInRole user_id, ['admin']

  randomNumber: (min, max) ->
    Math.floor(Math.random() * (max - min + 1)) + min
