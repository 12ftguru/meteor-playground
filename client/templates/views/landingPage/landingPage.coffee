Template.landingPage.onRendered ->
  $('body').addClass 'landing-page'
  $('body').scrollspy
    target: '.navbar-fixed-top'
    offset: 80
  return

Template.landingPage.onDestroyed ->
  $('body').removeClass 'landing-page'
  return

Template.landingPage.events 'click a.page-scroll': (event) ->
  event.preventDefault()
  link = $(event.target)
  $('html, body').stop().animate { scrollTop: $(link.attr('href')).offset().top - 50 }, 500
  return
