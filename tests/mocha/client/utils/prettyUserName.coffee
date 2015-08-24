if MochaWeb?
  MochaWeb.testOnly ->
    do chai.should
    describe 'Utils.prettyUserName', ->
      it 'should return "first middle last" if all three are defined.', ->
        user =
          profile:
            firstName: 'John'
            secondName: 'Q'
            lastName: 'Public'
        Utils.prettyUserName(user).should.equal 'John Q Public'

      it 'should return "first last" if both are defined but not secondName', ->
        user =
          profile:
            firstName: 'John'
            lastName: 'Public'
        Utils.prettyUserName(user).should.equal 'John Public'

      it 'should return username if first/last not defined', ->
        user =
          username: 'xMetalSlayerx'

        Utils.prettyUserName(user).should.equal 'xMetalSlayerx'
      it 'should return email if none of the above', ->
        user =
          emails: [
            { address: 'foo@bar.baz' }
          ]
        Utils.prettyUserName(user).should.equal 'foo@bar.baz'
