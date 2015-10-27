americano = require 'americano'
path = require 'path'
fs = require 'fs'

viewsDir = path.resolve __dirname, 'views'
useBuildView = fs.existsSync path.resolve viewsDir, 'index.js'

module.exports =
    common: 
        use : [
            americano.static path.resolve(__dirname, '../client/public'),
                maxAge: 86400000
            americano.bodyParser keepExtensions: true
        ]
        afterStart: (app, server) ->
            app.use (req, res) -> res.end()
            app.use americano.errorHandler
                dumpExceptions: true
                showStack: true
        set:
            'view engine': if useBuildView then 'js' else 'jade'
            'views': viewsDir

        engine:
            js: (path, locales, callback) ->
                callback null, require(path)(locales)

    development: [
        americano.logger 'dev'
    ]

    production: [
        americano.logger 'short'
    ]

    plugins: [
      'cozydb'
    ]
