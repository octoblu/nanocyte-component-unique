ReturnValue = require 'nanocyte-component-return-value'
Unique = require '../src/unique'

describe 'Unique', ->
  beforeEach ->
    @sut = new Unique

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with value that has unique items', ->
      it 'should return the message with unique items', ->
        envelope =
          message: 'dander-blaster'
          config:
            value: [1,2,3]
            key: 'red-car'

        expect(@sut.onEnvelope(envelope).config.value).to.deep.equal [1,2,3]

    describe 'when called with value that has non unique items', ->
      it 'should return the message with unique items', ->
        envelope =
          message: 'dander-blaster'
          config:
            value: [1, 2, 2, 3, 4, 5, 6, 6]
            key: 'red-car'

        expect(@sut.onEnvelope(envelope).config.value).to.deep.equal [1,2,3,4,5,6]

    describe 'when called with value of type string unique items', ->
      it 'should return the message with unique items', ->
        envelope =
          message: 'pyramid-scheme'
          config:
            value: 'cats'
            key: 'fission'

        expect(@sut.onEnvelope(envelope).config.value).to.deep.equal ['c','a','t','s']


    describe 'when called with value of type string with non unique items', ->
      it 'should return the message with unique items', ->
        envelope =
          message: 'pyramid-scheme'
          config:
            value: 'alpha'
            key: 'fission'

        expect(@sut.onEnvelope(envelope).config.value).to.deep.equal ['a','l','p','h']
