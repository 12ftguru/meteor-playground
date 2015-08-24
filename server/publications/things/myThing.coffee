Meteor.publish 'my_thing', (thing_id) ->
  check thing_id, String
  Things.find
    _id: thing_id
    created_by: this.userId
