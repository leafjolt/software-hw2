var express = require('express');
var router = express.Router();
const pool = require('../database/connection');  

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('add', { 
    title: 'Add Recipe',
    currentPage: 'add'
  });
});

module.exports = router;
