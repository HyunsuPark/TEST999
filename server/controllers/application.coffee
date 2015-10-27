async = require 'async'
log = require('printit')
        prefix: 'bookmarker (cozyDB):application'

getImports = (callback) -> 
  async.parallel [], (err, results) ->
    [instance] = results;

  locale = instance?.locale or 'en'
  callback null, """
    window.locale = "#{locale}#";
  """

getRequestTemplate = (req, res, callback) ->
  if callback then getImports callback else getImports (err, imports) ->
      return res.error 500, 'An error occured', err if err
      path = if req.route.path is '/' then '/index' else req.route.path
      res.render path.substring 1, path.length, imports: imports
      
module.exports =

  index: (req, res) -> 
    getRequestTemplate req, res

  home: (req, res) -> 
    getRequestTemplate req, res

  logClient: (req, res) ->
    log.error req.body.data
    log.error req.body.data.error?.stack
    res.send 'ok'
