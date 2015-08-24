@lastRoute = new ReactiveVar('/')

updateLastRoute = (context, redirect) ->
  lastRoute.set context.path

FlowRouter.triggers.exit([updateLastRoute])

FlowRouter.back = () ->
  FlowRouter.go lastRoute.get()

FlowRouter.route '/',
  name: "home"
  middlewares: []
  action: (params, queryParams) ->
    Tracker.autorun () ->
      unless Meteor.userId()
        BlazeLayout.render 'landingPage'
      else
        BlazeLayout.render 'layout',
          main: 'dashboard'
          nav: 'thing_nav'

AccountsTemplates.configureRoute 'signIn',
  name: 'signIn'
  path: '/login'

FlowRouter.route '/logout',
  name: "signOut"
  action: () ->
    Meteor.logout () ->
      FlowRouter.go '/'

## 404 Not Found
FlowRouter.notFound =
  action: ->
    BlazeLayout.render 'blankLayout',
      main: 'notFound'
      
    Meta.setTitle 'Not Found'
    Meta.set 'og:title', 'Playground | Not Found'
