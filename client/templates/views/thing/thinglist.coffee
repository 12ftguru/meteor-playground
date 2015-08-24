Template.navigation_thinglist.helpers
  things: () ->
    return Things.find(created_by: Meteor.userId())
  thing_count: () ->
    return Things.find(created_by: Meteor.userId()).count()
  has_things: (count) ->
    if count is 0
      return false
    return true

SubR Template.navigation_thinglist, 'my_things'
