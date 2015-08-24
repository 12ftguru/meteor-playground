
@Schemas.Thing = new SimpleSchema([
  @Schemas.BaseSchema
  @Schemas.TrackModifications
  { 
    sources:
      type: [ @Schemas.RelatedCollection ]
      optional: true
      label: 'Sources'
  }
])

@Things = new Mongo.Collection "things"
@Things.attachSchema @Schemas.Thing
