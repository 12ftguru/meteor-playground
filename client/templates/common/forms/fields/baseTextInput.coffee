ReactiveForms.createElement
  template: 'baseTextInput'
  validationEvent: 'keyup'
  reset: (el) ->
    $(el).val('')
