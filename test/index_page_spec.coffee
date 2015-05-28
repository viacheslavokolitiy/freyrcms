request = require('supertest')
expect = require('chai').expect()
express = require('express')
app = require('../app')
dom = require('mocha-jsdom').jsdom
http = require('http')

describe 'index page', (done)->
  before (done) ->
    @server = http.createServer(app)
    @server.listen(3000)

    done()

  after (done) ->
    @server.close()

    done()

  it 'should render index page', ->
    request(app).get('/').expect(200).end (err, res) ->
      if err
        return done(err)
      return







