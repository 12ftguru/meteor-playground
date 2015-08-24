Template.dateInput.onRendered () ->
  defaultValue = new moment(new Date($('.input-group.date input').val()))
  $('.input-group.date').datepicker('setDate', defaultValue.toDate())


ReactiveForms.createElement
  template: 'dateInput'
  validationEvent: 'keyup'
  reset: (el) ->
    $(el).val('')
