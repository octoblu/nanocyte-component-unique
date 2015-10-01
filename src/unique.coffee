ReturnValue = require 'nanocyte-component-return-value'
_ = require 'lodash'

class Unique extends ReturnValue
  onEnvelope: (envelope) =>
    {key,value} = envelope.config
    "#{key}": _.uniq(value)

module.exports = Unique
