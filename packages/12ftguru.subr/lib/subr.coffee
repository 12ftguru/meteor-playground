subManagers = new ReactiveDict 'subManagers'
  
SubR = (template, options) ->
  if _.isArray(options)
    subs = options
    options = {}
  else if options?
    subs = options.subscriptions
    delete options.subscriptions
  else
    options = {}

  unless _.isArray subs
    subs = [subs]

  managerName = if options.manager? then options.manager else 'Default'
  if _.isObject managerName
    managerOptions = managerName.options
    managerName = managerName.name
  else
    managerOptions = {}


  manager = subManagers.get 'managerName'


  unless manager?  
    manager = new SubsManager(managerOptions)
    subManagers.set managerName, manager

  template.onCreated ->
    self = this
    self.ready = new ReactiveVar
    self.autorun ->
      #postId = FlowRouter.getParam('postId')
      handles = []
      for sub in subs
        if _.isObject sub
          params = []
          subName = sub.publication
          if _.isFunction sub.params
            params = sub.params()
            unless _.isArray params
              params = [params]
          else if _.isString sub.params
            params.push sub.params
          params.unshift subName
          handles.push = manager.subscribe.apply(manager, params)
        else
          handles.push = manager.subscribe(sub)
        
      self.ready.set _.every(handles, (handle) ->
        handle.ready()
      )
      return
    return

  template.helpers subsReady:  ->
    Template.instance().ready.get()
