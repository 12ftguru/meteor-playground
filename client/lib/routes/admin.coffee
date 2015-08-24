AdminRoutes = FlowRouter.group
  prefix: '/admin',
  triggersEnter: [AccountsTemplates.ensureSignedIn]

AdminRoutes.route '/',
  name: 'adminHome'
  action: () ->
    BlazeLayout.render 'layout',
      main: 'dashboard'
      nav: 'adminNavigation'
    Meta.setTitle 'Admin'
    Meta.set 'og:title', 'Playground Admin'
