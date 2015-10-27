cozydb = require 'cozydb'
log = require('printit')
  prefix: 'bookmark:model'

module.exports = Bookmark = cozydb.getModel 'Bookmark',
    url: String
    title: String

Bookmark.all = (options, callback) ->
  Bookmark.request 'all', options, callback

Bookmark.byName = (options, callback) ->
  Bookmark.request 'byName', options, callback

Bookmark.getOrCreate = (data, callback) ->
  # url is primary key
  Bookmark.byName key: data.url, (err, bookmarks) ->
    if err
      log.error err
      Bookmark.create data, callback

    else if bookmarks.length is 0
      Bookmark.create data, callback

    else
      callback null, bookmarks[0]
