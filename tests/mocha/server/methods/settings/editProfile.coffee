if MochaWeb?
  MochaWeb.testOnly ->
    do chai.should
    expect = chai.expect
    describe 'settings/editProfile method', ->
      before () ->
        @sepUser = Meteor.users.insert
          username: 'non-admin-sep'
          emails: [{ address: 'sep@foo.bar', verified: true}]
          createdAt: Date.now()
          profile:
            firstName: 'Pre'
            secondName: 'SEP'
            lastName: 'User'

        stubs.create 'userId', Meteor, 'userId'
        stubs.userId.returns @sepUser


      after () ->
        do stubs.restoreAll
        Meteor.users.remove @sepUser

      it 'should reject invalid profile fields', ->
        doc =
          iAmInvalid: true
        expect( () ->
          Meteor.call "settings/editProfile", doc
        ).to.throw(Match.Error, /not allowed by the schema/)

      it 'should update the profile if fields are valid.', ->
        newProfile =
          firstName: 'John'
          secondName: 'Q'
          lastName: 'Public'
          bio: 'Some guy.'

        Meteor.call "settings/editProfile", newProfile
        user = Meteor.users.findOne @sepUser
        user.profile.firstName.should.equal newProfile.firstName
        user.profile.bio.should.equal newProfile.bio
