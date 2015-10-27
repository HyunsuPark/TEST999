cozydb = require 'cozydb'

module.exports =

    bookmark:
        all       : cozydb.defaultRequests.all
        byName    : cozydb.defaultRequests.by 'name'
