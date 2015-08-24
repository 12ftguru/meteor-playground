Template.settings_edit_profile.events
#  'click .save': (evt) ->
#    do evt.preventDefault
#    me = Template.instance()
#    values =
#      name: $(me.firstNode).find("[name=name]").val()



  'click .cancel': (evt) ->
    do evt.preventDefault
    do FlowRouter.back

Template.settings_edit_profile.helpers
  profileData: () ->
    if Meteor.user()?.profile?
      return Meteor.user().profile
    else
      return {}
  schema: () ->
    return Schemas.UserProfile
  action: () ->
    return (els, callbacks, changed) ->
      console.group '[forms] Action running!'
      console.log '[forms] Form data!', this
      console.log '[forms] HTML elements with `.reactive-element` class!', els
      console.log '[forms] Callbacks!', callbacks
      console.log '[forms] Changed fields!', changed
      values = {}
      for el in els
        if el.name?
          values[el.name] = $(el).val()
        else if $(el).hasClass('htmlarea')
          values[$(el).data('name')] = $(el).code()
      console.log '[forms] Values', values
      console.groupEnd()
      if values.birthday?
        values.birthday = new moment(values.birthday, 'MM/DD/YYYY').toDate()

      Meteor.call 'settings/editProfile', values, (err, result) ->
        if err?
          console.error err
          callbacks.failed(err)
        else
          toastr["success"]('Profile Updated.', 'Success')
          callbacks.success()
          callbacks.reset()
          FlowRouter.go 'settingsProfile'
