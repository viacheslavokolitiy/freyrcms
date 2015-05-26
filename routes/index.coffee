express = require('express')
router = express.Router()

render_index_page = ->
  router.get '/', (req, res, next) ->
    res.render 'index', title: 'Express'
    return
  return

render_index_page()
module.exports = router