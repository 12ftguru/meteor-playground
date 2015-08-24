Template.registerHelper 'pathFor', () ->
  pathName = arguments[0]
  params = arguments[1].hash if arguments[1]?.hash?
  path = FlowRouter.path pathName, params
  return path

Template.registerHelper 'isActiveRoute', () ->
  active = false
  FlowRouter.watchPathChange()
  currentPath = FlowRouter.current().path
  currentRouteName = FlowRouter.current().route.name
  match = arguments[0]
  if match?.hash?
    if match.hash.regex?
      regex = match.hash.regex
    else if match.hash.type?
      params = {}
      if match.hash.id?
        params['_id'] = match.hash.id
      regex = FlowRouter.path match.hash.type, params
    if match.hash.className?
      className = match.hash.className
    else
      className = 'active'
  if regex?
    active = className if currentPath.search(regex) > -1
    active = className if currentRouteName.search(regex) > -1
  return active

Template.registerHelper 'formatDate', (date, format) ->
  if format?.hash?
    format = 'MM/DD/YYYY'
  format ?= 'MM/DD/YYYY'
  return moment(date).format(format)

@styleColors = ['navy-blue', 'violet', 'blue', 'green', 'yellow', 'orange', 'red', 'red-deep']
@statusColors = ['primary', 'primary2', 'info', 'success', 'warning', 'warning2', 'danger', 'danger2']

Template.registerHelper 'getColor', () ->
  code = (this._id.charCodeAt(0) - 48) % styleColors.length
  return styleColors[code]

Template.registerHelper 'getStatusColor', () ->
  code = (this._id.charCodeAt(0) - 48) % statusColors.length
  return statusColors[code]

Template.registerHelper 'prettyCurrentUserName', () ->

  return Utils.prettyUserName Meteor.user()
Template.registerHelper 'prettyUserName', (user) ->
  return Utils.prettyUserName user

Template.registerHelper 'pluralize', (count, singular, plural) ->
  #Here is where we enter into a philosophical grammar debate
  # about whether -1 is plural or singular.
  if count is 1
    return singular
  return plural
