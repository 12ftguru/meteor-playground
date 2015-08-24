Meteor.publish 'my_things', () ->
  Things.find created_by: this.userId
