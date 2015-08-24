Template.htmlAreaField.onRendered () ->
  $(this.find('.htmlarea')).summernote
    airMode: true
    airPopover: [
      ['font', ['bold', 'italic', 'underline', 'clear']],
      ['para', ['paragraph', 'ul', 'ol']],
      ['edit', ['undo', 'redo', 'help']]
    ]
  
Template.htmlAreaField.helpers
  labelText: () ->
    unless @noLabel
      return @label

ReactiveForms.createElement
  template: 'htmlAreaField'
  validationEvent: 'keyup'
  reset: (el) ->
    $(el).val('')
  validationValue: (el, clean, template) ->
    #console.info 'SN Code %O', $(el).code()
    return $(el).code()
