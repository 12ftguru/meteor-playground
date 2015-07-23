Template.registerHelper 'log', (object) ->
  console.log object
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

Template.registerHelper 'dump', (object) ->
  console.groupCollapsed 'Template Dump'
  console.dir object
  console.dir Template.instance()
  do console.groupEnd
  return
