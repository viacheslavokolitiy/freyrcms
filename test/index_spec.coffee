request = require('supertest')
expect = require('chai').expect()
express = require('express')
app = express()

describe 'routes', ->
  describe '#render_index_page', ->
    it 'should render index page with Express', ->
      request(app).get('/').end (err,res) ->
        expect(res).to.equal("Express")
