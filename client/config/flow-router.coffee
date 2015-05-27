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



## Template helper
Template.registerHelper 'isReady', (sub) ->
  if sub?
    return FlowRouter.subsReady sub
  else
    return FlowRouter.subsReady()
