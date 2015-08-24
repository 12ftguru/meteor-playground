ReactiveForms.createElement
  template: 'selectField'
  validationEvent: 'keyup'
  reset: (el) ->
    $(el).val('')
  validationValue: (el, clean, template) ->
    if el.name isnt template.reactiveForms.field
      el = template.find('select')
    value = $(el).val()
    return clean value, removeEmptyStrings: false

val = new ReactiveVar()

Template.selectField.onRendered () ->
  val.set($(this.find('select')).val())

Template.selectField.events
  'change select': (evt) ->
    val.set($(evt.currentTarget).val())

Template.selectField.helpers
  option: () ->
    return this.toString()
  isChecked: () ->
    return this.toString() is Template.instance().reactiveForms.value.get()
  isOther: () ->
    return /[Oo]ther/.test(val.get())
  otherField: () ->
    if this.otherField?
      return this.otherField
    else
      return this.field + 'Other'
  otherValue: () ->
    if this.otherField?
      fieldName = this.otherField
    else
      fieldName = this.field + 'Other'
    return Template.instance().reactiveForms.parentData.data[fieldName]
