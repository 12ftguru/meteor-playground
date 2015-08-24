if MochaWeb?
  MochaWeb.testOnly ->
    do chai.should
    expect = chai.expect
    describe 'mix/add method', ->
      before ->
        stubs.create 'userId', Meteor, 'userId'
        stubs.userId.returns 'v4tSDTA9XHHxSRzJX' #Fake ID.

      after ->
        do stubs.restoreAll

      it 'should throw an error for bad schemas', () ->
        doc =
          notAGoodDoc: true

        #Have to wrap calls in functions to get thrown errors.
        expect( () ->
          Meteor.call "mix/add", doc
        ).to.throw(Match.Error, /not allowed by the schema/)

      it 'should add valid documents', () ->
        doc =
          name: 'My Awesome Mix'
        insertId = Meteor.call("mix/add", doc)
        newDoc = Mixes.findOne insertId
        newDoc.name.should.equal doc.name
