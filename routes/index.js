var express = require('express');
var router = express.Router();

function render_index_page(){
    router.get('/', function(req, res, next) {
        res.render('index', { title: 'Express' });
    });
}

render_index_page();

module.exports = router;