ReturnValue = require 'nanocyte-component-return-value'
_ = require 'lodash'
class Unique extends ReturnValue
  onEnvelope: (envelope) =>
    {config,message} = envelope
    {key,value} = config
    _.set envelope, 'config.value', _.uniq(value)

    envelope

module.exports = Unique
