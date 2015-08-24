SettingsRoutes = FlowRouter.group
  prefix: '/settings',
  triggersEnter: [AccountsTemplates.ensureSignedIn]

SettingsRoutes.route '/',
  name: 'settingsHome'
  action: () ->
    BlazeLayout.render 'layout',
      main: 'settings'
      nav: 'settings_nav'
        
    Meta.setTitle 'Settings'
    Meta.set 'og:title', 'Playground | Settings'

SettingsRoutes.route '/profile',
  name: 'settingsProfile'
  action: () ->
    BlazeLayout.render 'layout',
      main: 'settings_profile'
      nav: 'settings_nav'
      
    Meta.setTitle 'My Profile'
    Meta.set 'og:title', 'Playground | My Profile'

SettingsRoutes.route '/profile/edit',
  name: 'editSettingsProfile'
  action: () ->
    BlazeLayout.render 'layout',
      main: 'settings_edit_profile'
      nav: 'settings_nav'
      
    Meta.setTitle 'Edit Profile'
    Meta.set 'og:title', 'Playground | Edit Profile'
