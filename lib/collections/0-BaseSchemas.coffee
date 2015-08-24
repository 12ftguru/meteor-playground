#SimpleSchema.messages.required
SimpleSchema.messages
  required: "* Required"
  "regEx firstName": [
    {msg: "First name must contain only letters or a period (.) for initial."}
  ]
  "regEx secondName": [
    {msg: "Middle name must contain only letters or a period (.) for initial."}
  ]
  "regEx lastName": [
    {msg: "last name must contain only letters or hyphens."}
  ]

@Schemas ?= {}

@Schemas.RelatedCollection = new SimpleSchema
  id:
    type: String
    regEx: SimpleSchema.RegEx.Id
  name:
    type: String
    label: 'Name'
    optional: true
  object_type:
    type: String
    label: 'Type'
    optional: true

@Schemas.BaseSchema = new SimpleSchema
  name:
    type: String
    label: 'Name'
    instructions: ' '
    optional: false
  created_by:
    type: String
    optional: true
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if @isInsert and !@isSet
        return Meteor.userId()
      return
    denyUpdate: true
  create_date:
    type: Date
    optional: true
    autoValue: ->
      if @isInsert
        return new Date
      else if @isUpsert
        return { $setOnInsert: new Date }
      else
        @unset()
      return
    denyUpdate: true

@Schemas.TrackModifications = new SimpleSchema
  modified_by:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if @isUpdate
        return Meteor.userId()
      return
    denyInsert: true
    optional: true
  modified_date:
    type: Date
    autoValue: ->
      if @isUpdate
        return new Date
      return
    denyInsert: true
    optional: true
