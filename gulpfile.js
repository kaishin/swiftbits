argv = require("yargs").argv
browserSync = require("browser-sync")
cache = require("gulp-cached")
clip = require("gulp-clip-empty-files")
dateFormat = require("dateformat")
del = require("del")
ghPages = require("gulp-gh-pages")
gulp = require("gulp")
gutil = require("gulp-util")
include = require("gulp-include")
literate = require("gulp-writ")
minifyCSS = require("gulp-cssnano")
minifyJS = require("gulp-uglify")
prefix = require("gulp-autoprefixer")
removeEmptyLines = require("gulp-remove-empty-lines")
rename = require("gulp-rename")
replace = require("gulp-replace")
runSequence = require("run-sequence")
sass = require("gulp-sass")
scssLint = require("gulp-scss-lint")
shell = require("gulp-shell")
slugify = require("underscore.string/slugify")
uncss = require("gulp-uncss")

messages = {
  jekyllBuild: "Rebuilding Jekyll...",
  swiftSuccess: "\u2705  Swift compiled sucessfully!",
  uncssStart: "Cleaning CSS..."
}

now = new Date()
title = (ref = argv.t) != null ? ref : "Untitled"
dashedTitle = slugify(title)
sourceFolder = "./source"
targetFolder = "./_site"

paths = {
  jekyllFiles: [sourceFolder + "/**/*.html",
    sourceFolder + "/**/*.md",
    sourceFolder + "/**/*.yml",
    sourceFolder + "/**/*.xml",
    "!" + sourceFolder + "/node_modules/**/*"],
  sourcePosts: sourceFolder + "/_posts/",
  sourceScripts: sourceFolder + "/_scripts/",
  sourceStylesheets: sourceFolder + "/_scss/",
  targetScripts: targetFolder + "/scripts/",
  targetStylesheets: targetFolder + "/css/",
  targetSwift: "./swift/"
}

gulp.task("default", ["develop"])

gulp.task("develop", function() {
  runSequence(["watch", "browser-sync"])
})

gulp.task("swift", function() {
  runSequence(["generate-swift", "run-swift"])
})

gulp.task("build", function() {
  runSequence("swift", ["generate-css", "minify-scripts", "vendorize-scripts"], ["jekyll-build", "uncss"])
})

gulp.task("rebuild", function() {
  runSequence("jekyll-build-local", "reload")
})

gulp.task("yolo", function() {
  runSequence("build", "deploy")
})

gulp.task("clean", del.bind(null, ["_site"]))

gulp.task("watch", ["generate-css", "minify-scripts", "jekyll-build-local"], function() {
  gulp.watch(paths.sourceStylesheets + "/**/*.scss", ["generate-css"])
  gulp.watch(paths.sourceScripts + "/**/*.js", ["minify-scripts"])
  gulp.watch(paths.sourceScripts + "/vendor.js", ["vendorize-scripts"])
  gulp.watch(paths.jekyllFiles, ["rebuild"])
})

gulp.task("jekyll-build-local", shell.task("bundle exec jekyll build --incremental --config _config.yml,_config.serve.yml", {
  quiet: true
}))

gulp.task("jekyll-build", shell.task("bundle exec jekyll build"))

gulp.task("reload", function() {
  browserSync.reload()
})

gulp.task("doctor", shell.task("jekyll doctor"))

gulp.task("generate-css", function() {
  gulp.src(paths.sourceStylesheets + "/*.scss")
  .pipe(sass({
    precision: 2
  }))
  .on("error", sass.logError)
  .pipe(prefix(["last 2 versions", "> 2%", "ie 11", "Firefox ESR"], {
    cascade: false
  }))
  .pipe(cache(paths.targetStylesheets))
  .pipe(minifyCSS())
  .pipe(gulp.dest(paths.targetStylesheets))
  .pipe(browserSync.reload({
    stream: true
  }))
})

gulp.task("lint-scss", function() {
  gulp.src(paths.sourceStylesheets + "/*.scss")
  .pipe(cache(paths.sourceStylesheets))
  .pipe(scssLint({
    "config": ".scss-lint.yml",
    "bundleExec": true
  }))
  .pipe(scssLint.failReporter())
  .on("error", function(error) { gutil.log(error.message) })
})

gulp.task("uncss", function() {
  gutil.log(messages.uncssStart)
  gulp.src(paths.targetStylesheets + "*.css")
  .pipe(uncss({
    html: [targetFolder + "/**/*.html"]
  }))
  .pipe(minifyCSS())
  .pipe(gulp.dest(paths.targetStylesheets))
});

gulp.task("minify-scripts", function() {
  gulp.src([paths.sourceScripts + "/*.js", "!" + paths.sourceScripts + "/vendor.js"])
  .pipe(cache("minify-scripts"))
  .pipe(minifyJS())
  .pipe(gulp.dest(paths.targetScripts))
  .pipe(browserSync.reload({
    stream: true
  }))
})

gulp.task("vendorize-scripts", function() {
  gulp.src(paths.sourceScripts + "/vendor.js")
  .pipe(include())
  .on("error", function(error) { gutil.log(error.message) })
  .pipe(cache("vendorize-scripts"))
  .pipe(minifyJS())
  .pipe(gulp.dest(paths.targetScripts))
  .pipe(browserSync.reload({
    stream: true
  }))
})

gulp.task("browser-sync", function() {
  browserSync.init(null, {
    server: {
      baseDir: targetFolder
    },
    host: "localhost",
    port: 4000,
    browser: "Safari Preview"
  })
})

gulp.task("post", function() {
  gulp.src(paths.sourcePosts + "_template.md")
  .pipe(rename(dateFormat(now, "yyyy-mm-dd") + "-" + dashedTitle + ".md"))
  .pipe(replace(/DATE_PLACEHOLDER/g, dateFormat(now, "yyyy-mm-dd hh:MM:ss o")))
  .pipe(replace(/TITLE_PLACEHOLDER/g, title))
  .pipe(gulp.dest(paths.sourcePosts))
})

gulp.task("generate-swift", function() {
  gulp.src([paths.sourcePosts + "*.md", "!" + paths.sourcePosts+ "_template.md"])
  .pipe(replace(/(?!\/\/\ \-\>\ Error)\/\/.+/g, ""))
  .pipe(rename({
    extname: ".swift.md"
  }))
  .pipe(literate())
  .pipe(replace(/(.*\n)\/\/\ \-\>\ Error/g, "// $1"))
  .pipe(removeEmptyLines())
  .pipe(clip())
  .pipe(gulp.dest(paths.targetSwift))
});

gulp.task("swift-version", shell.task("swift --version;"))
gulp.task("run-swift", ["swift-version"], shell.task("./bin/test >> /dev/null"))
gulp.task("swift", ["generate-swift", "run-swift"], function() {
  gutil.log(messages.swiftSuccess);
})

gulp.task("deploy", function() {
  return gulp.src(targetFolder + "/**/*")
  .pipe(ghPages({
    message: "Deploy // " + Date()
  }))
})
