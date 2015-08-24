if MochaWeb?
  MochaWeb.testOnly ->
    do chai.should
    describe 'Utils.isOwnerOrAdmin', ->
      before () ->
        @nonAdminUser = Meteor.users.insert
          username: 'non-admin'
          emails: [ { address: 'non-admin@foo.bar', verified: true } ]
          createdAt: Date.now()
          profile:
            firstName: 'Non'
            secondName: 'Admin'
            lastName: 'User'

        @adminUser = Meteor.users.insert
          username: 'admin'
          emails: [ { address: 'admin@foo.bar', verified: true } ]
          createdAt: Date.now()
          roles: ['admin']
          profile:
            firstName: 'Admin'
            lastName: 'User'

      after () ->
        Meteor.users.remove @nonAdminUser
        Meteor.users.remove @adminUser

      it 'should return true if doc is createdby this user', ->
        doc =
          name: 'testdoc'
          createdBy: @nonAdminUser
        Utils.isOwnerOrAdmin(@nonAdminUser, doc).should.be.true

      it 'should return true if doc is not createdby user but user is admin', ->
        doc =
          name: 'testdoc'
          createdBy: @nonAdminUser
        Utils.isOwnerOrAdmin(@adminUser, doc).should.be.true

      it 'should return false if doc is not created by user and user is not admin', ->
        doc =
          name: 'testdoc'
          createdBy: @adminUser
        Utils.isOwnerOrAdmin(@nonAdminUser, doc).should.be.false
