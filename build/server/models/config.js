// Generated by CoffeeScript 1.10.0
var Config, americano;

americano = require('cozydb');

module.exports = Config = americano.getModel('BookmarkConfig', {
  nameOrder: {
    type: String,
    "default": 'not-set'
  }
});

Config.getInstance = function(callback) {
  return Config.request('all', function(err, configs) {
    var config;
    if (err) {
      return callback(err);
    }
    config = (configs != null ? configs[0] : void 0) || new Config();
    return callback(null, config.toJSON());
  });
};

Config.set = function(hash, callback) {
  return Config.request('all', function(err, configs) {
    var config;
    if (err) {
      return callback(err);
    }
    if (config = configs != null ? configs[0] : void 0) {
      return config.updateAttributes(hash, callback);
    } else {
      return Config.create(hash, callback);
    }
  });
};
