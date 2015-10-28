// Generated by CoffeeScript 1.4.0
var async, getImports, getRequestTemplate, log;

async = require('async');

log = require('printit')({
  prefix: 'bookmarker (cozyDB):application'
});

getImports = function(callback) {
  var locale;
  async.parallel([], function(err, results) {
    var instance;
    return instance = results[0], results;
  });
  locale = (typeof instance !== "undefined" && instance !== null ? instance.locale : void 0) || 'en';
  return callback(null, "window.locale = \"" + locale + "#\";");
};

getRequestTemplate = function(req, res, callback) {
  if (callback) {
    return getImports(callback);
  } else {
    return getImports(function(err, imports) {
      var path;
      if (err) {
        return res.error(500, 'An error occured', err);
      }
      path = req.route.path === '/' ? '/index' : req.route.path;
      return res.render(path.substring(1, path.length, {
        imports: imports
      }));
    });
  }
};

module.exports = {
  index: function(req, res) {
    return getRequestTemplate(req, res);
  },
  home: function(req, res) {
    return getRequestTemplate(req, res);
  },
  logClient: function(req, res) {
    var _ref;
    log.error(req.body.data);
    log.error((_ref = req.body.data.error) != null ? _ref.stack : void 0);
    return res.send('ok');
  }
};
