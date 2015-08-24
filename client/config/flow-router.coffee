FlowRouter.route '/',
  name: "dashboard"
  subscriptions: (params, queryParams) ->
  action: (params, queryParams) ->
    Tracker.autorun () ->
      unless Meteor.userId()
        BlazeLayout.render 'landingPage'
      else
        BlazeLayout.render 'layout',
          main: 'dashboard'
    
  name: 'home'

AccountsTemplates.configureRoute 'signIn',
  name: 'signIn'
  path: '/login'
  #template: 'loginPanel'
  layoutTemplate: 'blankLayout'
  layoutRegions:
    main: "fullPageAtForm"
  redirect: '/'

FlowRouter.route '/logout',
  name: "signOut"
  action: () ->
    Meteor.logout () ->
      FlowRouter.go '/'

## 404 Not Found
FlowRouter.notFound =
  subscriptions: ->
  action: ->
    BlazeLayout.render 'blankLayout',
      main: 'notFound'

## Template helper
Template.registerHelper 'isReady', (sub) ->
  if sub?
    return FlowRouter.subsReady sub
  else
    return FlowRouter.subsReady()
