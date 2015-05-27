console.info 'Compatibility code loaded. This is bad.'

Template.registerHelper 'pathFor', () ->
  console.warn 'Unimplemented helper pathFor called', arguments
  return ''

Template.registerHelper 'isActiveRoute', () ->
  console.warn 'Unimplemented helper isActiveRoute called', arguments
  return false
