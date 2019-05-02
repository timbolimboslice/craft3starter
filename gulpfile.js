"use strict";

// Load plugins
const autoprefixer = require("autoprefixer");
const browsersync = require("browser-sync").create();
const cssnano = require("cssnano");
const del = require("del");
const eslint = require("gulp-eslint");
const gulp = require("gulp");
const plumber = require("gulp-plumber");
const postcss = require("gulp-postcss");
const rename = require("gulp-rename");
const sass = require("gulp-sass");
const webpack = require("webpack");
const webpackconfigScripts = require("./webpack-scripts.config.js");
const webpackconfigPlugins = require("./webpack-plugins.config.js");
const webpackstream = require("webpack-stream");
const babel = require('gulp-babel');
const terser = require('gulp-terser');
const concat = require('gulp-concat');

// BrowserSync
function browserSync(done) {
    browsersync.init({
        proxy: "http://dev.SOMEDOMAIN.com"
    });
    done();
}

// BrowserSync Reload
function browserSyncReload(done) {
  browsersync.reload();
  done();
}

// Clean assets
function clean() {
    del(["./craft/web/assets/css"]);
    del(["./craft/web/assets/js"]);
    return;
}

// CSS task
function css() {
    return (
    gulp
        .src("src/scss/**.scss")
        .pipe(plumber())
        .pipe(sass({ outputStyle: "expanded" }))
        .pipe(gulp.dest("craft/web/assets/css"))
        .pipe(rename({ suffix: ".min" }))
        .pipe(postcss([autoprefixer(), cssnano()]))
        .pipe(gulp.dest("craft/web/assets/css"))
        .pipe(browsersync.stream())
    );
}


// Lint scripts
function scriptsLint(done) {
  // return gulp
  //   .src(["src/js/scripts.js", "./gulpfile.js"])
  //   .pipe(plumber())
  //   .pipe(eslint())
  //   .pipe(eslint.format())
  //   .pipe(eslint.failAfterError());
  done();
}

// Transpile, concatenate and minify script
function scripts() {
  return (
     gulp.src('src/js/scripts.js')
        .pipe(babel().on('error', function(err){
            console.log(err)
        }))
        .pipe(gulp.dest('craft/web/assets/js'))
        .pipe(terser().on('error', function(err) {
            console.log(err)
        }))
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest('craft/web/assets/js'))
        .pipe(browsersync.stream())
        .on('error', function(err){
            console.log(err)
        })
  );
}

// Transpile, concatenate and minify plugins
function jsPlugins() {
  return (
    gulp.src('src/js/plugins/*.js')
      .pipe(concat('plugins.js'))
      .pipe(terser().on('error', function(err){
        console.log(err)
      }))
      .pipe(gulp.dest('craft/web/assets/js'))
      .pipe(browsersync.stream())
  )
}

function notify(done) {
  browsersync.notify("Compiling, please wait.");
  done();
}

// Watch files
function watchFiles() {
  //gulp.watch("src/scss/**.scss", css);
  gulp.watch("src/scss/**.scss", gulp.series(notify, css));
  gulp.watch("src/js/**.js", gulp.series(scriptsLint, notify, scripts, jsPlugins));
  gulp.watch(
    [
      "./craft/templates/**/*.*"
    ],
    gulp.series(browserSyncReload, notify)
  );
}

// define complex tasks
const js = gulp.series(scriptsLint, scripts, jsPlugins);
const build = gulp.series(clean, gulp.parallel(css, js));
const watch = gulp.parallel(watchFiles, browserSync);

// export tasks
exports.css = css;
exports.js = js;
exports.clean = clean;
exports.build = build;
exports.watch = watch;
exports.default = build;
