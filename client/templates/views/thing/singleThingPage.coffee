Template.singleThingPage.helpers
  thing: () ->
    return Things.findOne(
      _id: FlowRouter.getParam '_id'
      created_by: Meteor.userId()
    )

SubR Template.singleThingPage,
  publication: 'my_thing'
  params: () ->
    FlowRouter.getParam('_id')
