ReturnValue = require 'nanocyte-component-return-value'
Unique = require '../src/unique'

describe 'Unique', ->
  beforeEach ->
    @sut = new Unique

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      it 'should return the message', ->
        expect(@sut.onEnvelope({message: 'anything'})).to.deep.equal 'anything'
