argv = require("yargs").argv
browserSync = require "browser-sync"
cache = require "gulp-cached"
coffee = require "gulp-coffee"
dateFormat = require "dateformat"
del = require "del"
gulp = require "gulp"
gutil = require "gulp-util"
include = require "gulp-include"
literate = require "gulp-writ"
mediaQueries = require "gulp-combine-media-queries"
minifyCSS = require "gulp-minify-css"
minifyJS = require "gulp-uglify"
prefix = require "gulp-autoprefixer"
removeEmptyLines = require "gulp-remove-empty-lines"
rename = require "gulp-rename"
replace = require "gulp-replace"
runSequence = require "run-sequence"
run = require "gulp-run"
sass = require "gulp-sass"
scssLint = require "gulp-scss-lint"
slugify = require "underscore.string/slugify"

now = new Date()
title = argv.t ? "Untitled"
dashedTitle = slugify(title)
messages =
  jekyllBuild: "Rebuilding Jekyll..."
  swiftSuccess: "\u2705  Swift compiled sucessfully!"

sourceFolder = "."
destinationFolder = "./_site"

paths =
  sass: "#{sourceFolder}/_scss/"
  coffee: "#{sourceFolder}/_coffee/"
  styles: "#{sourceFolder}/css/"
  destinationStyles: "#{destinationFolder}/css/"
  scripts: "#{sourceFolder}/scripts/"
  destinationScripts: "#{destinationFolder}/scripts/"
  jekyllFiles: [
    "#{sourceFolder}/**/*.html",
    "#{sourceFolder}/**/*.md",
    "#{sourceFolder}/**/*.yml",
    "#{sourceFolder}/**/*.xml",
    "!#{sourceFolder}/node_modules/**/*",
    "!#{destinationFolder}/**/*"
  ]

gulp.task "default", ["develop"]

gulp.task "develop", ->
  runSequence ["watch", "browser-sync"]

gulp.task "swift", ->
  runSequence ["generate-swift", "run-swift"]

gulp.task "build", ->
  runSequence ["sass", "coffee", "vendor-js"], "list-scss", "jekyll-build", "swift"

gulp.task "clean",
  del.bind(null, ["_site"])

gulp.task "watch", ["sass", "coffee", "jekyll-build-local"], ->
  gulp.watch "#{paths.sass}/**/*.scss", ["sass"]
  gulp.watch "#{paths.coffee}/**/*.coffee", ["coffee"]
  gulp.watch "#{paths.coffee}/vendor.js", ["vendor-js"]
  gulp.watch paths.jekyllFiles, ["jekyll-reload"]

gulp.task "jekyll-build-local", ->
  run "bundle exec jekyll build --config _config.yml,_config.serve.yml", silent: true
    .exec()
  browserSync.notify messages.jekyllBuild

gulp.task "jekyll-build", ->
  run "bundle exec jekyll build", silent: true
    .exec()

gulp.task "jekyll-reload", ["jekyll-build-local"], ->
  browserSync.reload()

gulp.task "doctor", ->
  run "jekyll doctor"
    .exec()

gulp.task "sass", ->
  gulp.src "#{paths.sass}/*.scss"
    .pipe sass
      errLogToConsole: true
      precision: 2
    .pipe prefix ["last 2 versions", "> 2%", "ie 11", "Firefox ESR"], cascade: false
    .pipe mediaQueries()
    .pipe cache paths.styles
    .pipe minifyCSS()
    .pipe gulp.dest(paths.destinationStyles)
    .pipe gulp.dest(paths.styles)
    .pipe browserSync.reload(stream: true)

gulp.task "list-scss", ->
  gulp.src "#{paths.sass}/*.scss"
    .pipe cache paths.sass
    .pipe scssLint
      "config": ".scss-lint.yml",
      "bundleExec": true
    .pipe scssLint.failReporter()
    .on "error", (error) -> gutil.log(error.message)

gulp.task "coffee", ->
  gulp.src "#{paths.coffee}/*.coffee"
    .pipe cache paths.coffee
    .pipe coffee bare: true
    .on "error", (error) -> gutil.log(error.message)
    .pipe cache paths.scripts
    .pipe minifyJS()
    .pipe gulp.dest(paths.destinationScripts)
    .pipe gulp.dest(paths.scripts)
    .pipe browserSync.reload(stream: true)

gulp.task "vendor-js", ->
  gulp.src "#{paths.coffee}/vendor.js"
    .pipe include()
    .on "error", (error) -> gutil.log(error.message)
    .pipe cache paths.scripts
    .pipe minifyJS()
    .pipe gulp.dest(paths.destinationScripts)
    .pipe gulp.dest(paths.scripts)
    .pipe browserSync.reload(stream: true)

gulp.task "browser-sync", ->
  browserSync.init null,
    server:
      baseDir: destinationFolder
    host: "localhost"
    port: 4000
    open: true
    browser: "chrome"

gulp.task "post", ->
  gulp.src "./_posts/_template.md"
    .pipe rename "#{dateFormat(now, 'yyyy-mm-dd')}-#{dashedTitle}.md"
    .pipe replace(/DATE_PLACEHOLDER/g, "#{dateFormat(now, 'yyyy-mm-dd hh:MM:ss o')}")
    .pipe replace(/TITLE_PLACEHOLDER/g, dashedTitle)
    .pipe gulp.dest("./_posts")

gulp.task "generate-swift", ->
  gulp.src ["./_posts/*.md", "!./_posts/_template.md"]
    .pipe replace(/(?!\/\/\ \-\>\ Error)\/\/.+/g, "")
    .pipe rename
      extname: ".swift.md"
    .pipe literate()
    .pipe replace(/(.*\n)\/\/\ \-\>\ Error/g, "// $1")
    .pipe removeEmptyLines()
    .pipe gulp.dest("./_swift")

gulp.task "run-swift", ->
  gulp.src "./_swift/*.swift"
    .pipe run "swift <%= file.path %>", silent: true
  run("swift --version").exec()
  gutil.log(messages.swiftSuccess)


