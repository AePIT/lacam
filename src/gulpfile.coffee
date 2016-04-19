gulp = require "gulp"
del = require 'del'
$ = require('gulp-load-plugins')();

gulp.task "default", ['build']

gulp.task 'build', ['clean', 'html', 'styles', 'scripts', 'docs', 'fonts', 'favicon']

gulp.task 'clean', ->
  del '../product', force:true

gulp.task "html",->
  gulp.src 'index.html'
  .pipe $.minifyHtml()
  .pipe gulp.dest '../product'

gulp.task "styles", ->
  gulp.src ['assets/css/style.min.css', 'assets/css/custom.css', 'assets/css/custom-main.css', 'assets/css/feature.css']
  .pipe $.autoprefixer()
  .pipe $.concat 'main.min.css'
  .pipe $.minifyCss()
  .pipe gulp.dest '../product/assets/css'

gulp.task "scripts", ->
  gulp.src ['assets/js/main.min.js', 'assets/js/feature-anim.js']
  .pipe $.concat 'main.min.js'
  .pipe $.uglify()
  .pipe gulp.dest '../product/assets/js'

gulp.task "docs", ->
  gulp.src 'assets/docs/**/*'
  .pipe gulp.dest '../product/assets/docs'

gulp.task "fonts", ->
  gulp.src 'assets/fonts/**/*'
  .pipe gulp.dest '../product/assets/fonts'

gulp.task "images", ->
  gulp.src 'assets/img/**/*'
  .pipe $.imagemin()
  .pipe gulp.dest '../product/assets/img'

gulp.task "favicon", ->
  gulp.src 'favicon.ico'
  .pipe gulp.dest '../product'