exec = require 'executive'

task 'build', 'Build project', ->
  exec './node_modules/.bin/coffee -bc -o lib/ src/'

task 'test', 'run tests', ->
  exec "NODE_ENV=test
    ./node_modules/.bin/mocha
    --compilers coffee:coffee-script
    --reporter spec
    --colors
    --timeout 60000
    test/integration test/unit"

task 'test:integration', 'run integration tests', ->
  exec "NODE_ENV=test
    ./node_modules/.bin/mocha
    --compilers coffee:coffee-script
    --reporter spec
    --colors
    test/integration"

task 'test:unit', 'run unit tests', ->
  exec "NODE_ENV=test
    ./node_modules/.bin/mocha
    --compilers coffee:coffee-script
    --reporter spec
    --colors
    test/unit"

task 'publish', 'Publish current version to NPM', ->
  exec [
    './node_modules/.bin/coffee -bc -o lib/ src/'
    'git push'
    'npm publish'
  ]
