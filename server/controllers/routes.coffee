{SimpleController} = require 'cozydb'
application = require './application'
bookmark = require './bookmark'
BookmarkController = new SimpleController
  model: require('../models/bookmark')
  reqProp: 'bookmark'
  reqParamID: 'bookmarkid'

module.exports =

  '':
    get: application.index

  'templates/home':
    get: application.home
  
  'bookmark':
    get: bookmark.all
    post: bookmark.create
