exports.config =
  # Edit the next line to change default build path.
  config:
      path:
          public:'public'

  files:
    javascripts:
      # Describes how files will be compiled & joined together.
      # Available formatsu
      # * 'outputFilePath'
      # * map of ('outputFilePath': /regExp that matches input path/)
      # * map of ('outputFilePath': function that takes input path)
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^vendor/
        'test/javascripts/test.js': /^test(\/|\\)(?!vendor)/
        'test/javascripts/test-vendor.js': /^test(\/|\\)(?=vendor)/

      # Defines compilation order.
      # `vendor` files will be compiled before other ones
      # even if they are not present here.
      order:
        before: [
          'vendor/scripts/jquery.min.js'
          'vendor/scripts/angular.js'
          'vendor/scripts/angular-route.js'
          'vendor/scripts/angular-animate.js'
        ]
        
    stylesheets:
      defaultExtension: 'styl'
      joinTo: 'stylesheets/app.css'
      order:
        before: []

    templates:
      defaultExtension: 'jade'
      joinTo: 'javascripts/app.js'

  # Change this if you're using something other than backbone (e.g. 'ember').
  # Content of files, generated with `brunch generate` depends on the setting.
  # framework: 'backbone'

  # Enable or disable minifying of result js / css files.
  minify: no

