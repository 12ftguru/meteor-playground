ThingRoutes = FlowRouter.group
  prefix: '/thing',
  triggersEnter: [AccountsTemplates.ensureSignedIn]

ThingRoutes.route '/',
  name: 'myThings'
  action: () ->
    BlazeLayout.render 'layout',
      main: 'thingPage'
      nav: 'thing_nav'  
    Meta.setTitle 'My Things'
    Meta.set 'og:title', 'Playground | My Things'


ThingRoutes.route '/add',
  name: 'addThing'
  action: () ->
    BlazeLayout.render 'layout',
      main: 'addThing'
      nav: 'thing_nav'
        
    Meta.setTitle 'Add Thing'
    Meta.set 'og:title', 'Playground | My Thing'


ThingRoutes.route '/:_id',
  name: 'showThing'
  action: () ->
    BlazeLayout.render 'layout',
      main: 'singleThingPage'
      nav: 'thing_nav'
      
    Meta.setTitle 'My Things'
    Meta.set 'og:title', 'Playground | My Things'

