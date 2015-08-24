Template.baseForm.helpers
  buttons: () ->
    if this.submit is false
      return false
    return true
  cancelText: () ->
    if this.cancel isnt false
      this.cancel ?= 'Cancel'
      return this.cancel
    return false
  submitText: () ->
    if this.submit isnt false
      this.submit ?= 'Submit'
      return this.submit
    return false

ReactiveForms.createFormBlock
  template: 'baseForm'
  submitType: 'normal'
  
    
