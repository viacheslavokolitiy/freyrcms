request = require('supertest')
expect = require('chai').expect()
express = require('express')
app = express()

describe 'routes', ->
  describe '#render_index_page', ->
    it 'should render index page with Express', ->
      request(app).get('/').end (err,res) ->
        expect(res).to.equal("Express")

  describe '#render_signup_page', (done) ->
    it 'should render signup page', ->
      request(app).get('/signup').expect(200).end (err, res) ->
        if err
          return done(err)
        done()
        return
    return

  describe '#render_sign_in_page', (done) ->
    it 'should render sign in page', ->
      request(app).get('/signin').expect(200).end (err, res) ->
        if err
          return done(err)
        done()
        return
      return
