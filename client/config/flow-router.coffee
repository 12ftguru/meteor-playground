FlowRouter.route '/',
  middlewares: []
  #subscriptions: (params, queryParams) ->
  action: (params, queryParams) ->
    console.log 'Params:', params
    console.log 'Query Params:', queryParams
    FlowLayout.render 'layout',
      main: 'dashboard'
    return
  name: 'home'



## 404 Not Found
FlowRouter.notFound =
  subscriptions: ->
  action: ->
    FlowLayout.render 'blankLayout',
      main: 'notFound'

## Template helper
Template.registerHelper 'isReady', (sub) ->
  if sub?
    return FlowRouter.subsReady sub
  else
    return FlowRouter.subsReady()
