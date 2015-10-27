Bookmark = require '../models/bookmark'

module.exports.all = (req, res, next) ->
  Bookmark.byName (err, results) ->
    return next err if err

    res.send 200, results

module.exports.create = (req, res) ->
  data = req.body
  Bookmark.getOrCreate data, (err, bookmark) ->
    if err?
      res.send error: 'Server error while creating bookmark.', 500
    else
      res.send bookmark, 201

module.exports.update = (req, res) ->
  data = req.body
  req.tag.updateAttributes data, (err, bookmark) ->
    if err?
      res.send error: 'Server error while updating the bookmark.', 500
    else
      res.send bookmark, 200	

module.exports.delete = (req, res) ->
  console.log(req.body)
  console.log(req.bookmark)
  console.log(req)
  req.bookmark.destroy (err) ->
    if err?
      res.send error: 'Server error while deleting the bookmark.', 500
    else
      res.send success: true, 200
