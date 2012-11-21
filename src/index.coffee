async = require 'async'
shh = require 'shh'

class Puppet
  constructor: (options = {}) ->
    @host       = options.host
    @port       = options.port or 22
    @username   = options.username
    @privateKey = options.privateKey
    @publicKey  = options.publicKey

  connect: (callback) ->
    @client = new shh.Client
      host: @host
      port: @port
      username: @username
      privateKey: @privateKey
      publicKey: @publicKey

    @client.on 'stdout', (line) ->
      console.log "[out (#{options.host})]", line

    @client.on 'stderr', (line) ->
      console.error "[err (#{options.host})]", line

    @client.connect ->
      callback null

  exec: (options, cmds, callback) ->
    if not Array.isArray cmds
      cmds = [cmds]

      async.map cmds
      , (cmd, _callback) =>
        @client.exec cmd, (err, out) ->
          _callback err, out
      , (err, results) =>
        @client.close()
        callback err, results

module.exports = Puppet
