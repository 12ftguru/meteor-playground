Template.addThing.events
#  'click .save': (evt) ->
#    do evt.preventDefault
#    me = Template.instance()
#    values =
#      name: $(me.firstNode).find("[name=name]").val()



  'click .cancel': (evt) ->
    do evt.preventDefault
    do FlowRouter.back

Template.addThing.helpers
  schema: () ->
    return Schemas.Thing
  action: () ->
    return (els, callbacks, changed) ->
      #console.log '[forms] Action running!'
      #console.log '[forms] Form data!', this
      #console.log '[forms] HTML elements with `.reactive-element` class!', els
      #console.log '[forms] Callbacks!', callbacks
      #console.log '[forms] Changed fields!', changed
      values = {}
      for el in els
        values[el.name] = $(el).val()

      Meteor.call 'thing/add', values, (err, result) ->
        if err?
          console.error err
          callbacks.failed(err)
        else
          #console.info 'thing added', result
          toastr["success"]('Thing "'+values.name+'" added.', 'Success')
          callbacks.success()
          callbacks.reset()
          console.warn 'TODO: remove flowrouter go'
          FlowRouter.go '/thing'
