// Generated by CoffeeScript 1.10.0
var cozydb;

cozydb = require('cozydb');

module.exports = {
  bookmark: {
    all: cozydb.defaultRequests.all,
    byName: cozydb.defaultRequests.by('name')
  }
};
