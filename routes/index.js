var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Node from Docker. Automatic deployment from github part 2' });
});

module.exports = router;
