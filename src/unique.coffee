ReturnValue = require 'nanocyte-component-return-value'

class Unique extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = Unique
