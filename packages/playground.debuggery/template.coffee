Template.registerHelper 'log', (object) ->
  console.log object
  console.log Template.instance().view.name
  return

Template.registerHelper 'info', (object) ->
  console.info object
  return

Template.registerHelper 'warn', (object) ->
  console.warn object
  return

Template.registerHelper 'error', (object) ->
  console.error object
  return

Template.registerHelper 'dump', (obj) ->
  if obj?.hash?.label?
    console.group 'Template Dump: ' + Template.instance().view.name.substr(9)
    console.info obj.hash.label
  else
    console.groupCollapsed 'Template Dump: ' + Template.instance().view.name.substr(9)
  
  console.log 'Data Context: %O', this
  console.dir Template.instance()
  do console.groupEnd
  return

Template.registerHelper 'test', () ->
  console.info 'Test:'
  console.dir arguments
