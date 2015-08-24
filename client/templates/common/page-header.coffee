Template.pageHeader.events 'click .small-header-action': (event) ->
  event.preventDefault()
  $('.normalheader').toggleClass 'small-header'
  $('#hbreadcrumb').toggleClass 'm-t-lg'
  $('.clip-header i').toggleClass('fa-arrow-up').toggleClass 'fa-arrow-down'
  return

Template.pageHeader.helpers
  notHome: ->
    return @category.toLowerCase() != 'home'
  categories: ->
    return @category.split('|')
