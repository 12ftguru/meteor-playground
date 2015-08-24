@Schemas ?= {}

@Schemas.UserCountry = new SimpleSchema(
  name:
    type: String

  code:
    type: String
    regEx: /^[A-Z]{2}$/
)

@Schemas.UserProfile = new SimpleSchema(
#Custom validation messages are in 0-BaseSchemas.coffee
  firstName:
    type: String
    regEx: /^[a-zA-Z]{1,25}$/
    optional: true

#Called second name by some 3rd party packages.
  secondName:
    type: String
    regEx: /^[a-zA-Z-\.]{1,25}$/
    optional: true

  lastName:
    type: String
    regEx: /^[a-zA-Z-]{2,25}$/
    optional: true

  birthday:
    type: Date
    optional: true

  gender:
    type: String
    allowedValues: [
      "Female"
      "Male"
      "Trans"
      "Other (please specify)"
      "Prefer to not disclose"
    ]
    optional: true

  genderOther:
    type: String
    optional: true

  website:
    type: String
    regEx: SimpleSchema.RegEx.Url
    optional: true

  bio:
    type: String
    optional: true

)

@Schemas.UserProfileForm = new SimpleSchema(
  profileIsPublic:
    type: Boolean
    optional: true
    label: "Make your profile public?"

  profilePublicUrl:
    type: String
    regEx: SimpleSchema.RegEx.Url
    optional: true
    label: "Public Profile Username (eg. my_user_name)"

  profile:
    type: @Schemas.UserProfile
    optional: true
)

@Schemas.User = new SimpleSchema(

  emails:
    type: [Object]

    # this must be optional if you also use other login services like facebook,
    # but if you use only accounts-password, then it can be required
    optional: true

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email

  "emails.$.verified":
    type: Boolean

  createdAt:
    type: Date

  profileIsPublic:
    type: Boolean
    optional: true
    label: "Make your profile public?"

  profilePublicUrl:
    type: String
    regEx: SimpleSchema.RegEx.Url
    optional: true
    label: "Public Profile Username (eg. my_user_name)"

  profile:
    type: @Schemas.UserProfile
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true


  # Add `roles` to your schema if you use the meteor-roles package.
  # Note that when using this package, you must also specify the
  # `Roles.GLOBAL_GROUP` group whenever you add a user to a role.
  # Roles.addUsersToRoles(userId, ["admin"], Roles.GLOBAL_GROUP);
  # You can't mix and match adding with and without a group since
  # you will fail validation in some cases.
  roles:
    type: [String]
    optional: true
    blackbox: true
)

Meteor.users.attachSchema @Schemas.User

if Meteor.isServer
  Meteor.publish "userData", ->
    Meteor.users.find
      _id: @userId
    ,
      fields:
        profile: 1
        emails: 1
        createdAt: 1
        profileIsPublic: 1
        profilePublicUrl: 1
