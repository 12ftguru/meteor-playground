Template.thing_nav.onRendered ->
  # Initialize metsiMenu plugin to sidebar menu
  #    $('#side-menu').metisMenu();
  return

Template.thing_nav.events 'click #side-menu a:not([href$="\\#"])': ->
  if $(window).width() < 769
    $('body').toggleClass 'show-sidebar'
  return
