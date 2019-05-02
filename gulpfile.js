var gulp = require('gulp'),
    sass = require('gulp-sass'),
    browserSync = require('browser-sync').create(),
    autoprefixer = require('gulp-autoprefixer'),
    uglify = require('gulp-uglify'),
    header  = require('gulp-header'),
    rename = require('gulp-rename'),
    watch = require('gulp-watch'),
    cleanCSS = require('gulp-clean-css'),
    neat = require('node-neat').includePaths,
    concat = require('gulp-concat'),
    imagemin = require('gulp-imagemin'),
    plumber = require('gulp-plumber'),
    gutil = require('gulp-util'),
    babel = require('gulp-babel'),
    bourbon = require('node-bourbon').includePaths;

gulp.task('css', function () {
    gulp.src('src/scss/style.scss')
        .pipe(plumber({ errorHandler: onError }))
        .pipe(sass({
            errLogToConsole: true,
            includePaths: ['css'].concat(neat).concat(bourbon)
        })).on('error', function(err){
            console.log(err)
        })
        .pipe(autoprefixer('last 4 version'))
        .pipe(gulp.dest('craft/web/assets/css'))
        .pipe(cleanCSS({
            advanced: false,
            aggressiveMerging: false
        }))
        .pipe(rename({ suffix: '.min' }))
        //.pipe(header(banner, { package : package }))
        .pipe(gulp.dest('craft/web/assets/css'))
        .pipe(browserSync.reload({stream:true}))
        .on('error', function(err){
            console.log(err)
        });

    gulp.src('src/scss/custom-redactor.scss')
        .pipe(plumber({ errorHandler: onError }))
        .pipe(sass({
            errLogToConsole: true,
            includePaths: ['css']
        })).on('error', function(err){
            console.log(err)
        })
        .pipe(autoprefixer('last 4 version'))
        .pipe(gulp.dest('craft/web/assets/css'))
        .pipe(cleanCSS({
            advanced: false,
            aggressiveMerging: false
        }))
        .pipe(rename({ suffix: '.min' }))
        //.pipe(header(banner, { package : package }))
        .pipe(gulp.dest('craft/web/assets/css'))
        .pipe(browserSync.reload({stream:true}))
        .on('error', function(err){
            console.log(err)
        });

    //return;
});


gulp.task('js',function(){
    gulp.src('src/js/plugins/*.js')
        .pipe(concat('plugins.js'))
        .pipe(uglify({
            mangle: true
        })).on('error', function(err){
            console.log(err)
        })
        .pipe(gulp.dest('craft/web/assets/js'))
        .pipe(browserSync.reload({stream:true, once: true}));

    gulp.src('src/js/scripts.js')
        //.pipe(header(banner, { package : package }))
        .pipe(babel({presets: ['env']})).on('error', function(err){
            console.log(err)
        })
        .pipe(gulp.dest('craft/web/assets/js'))
        .pipe(uglify()).on('error', function(err){
            console.log(err)
        })
        //.pipe(header(banner, { package : package }))
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest('craft/web/assets/js'))
        .pipe(browserSync.reload({stream:true, once: true}))
        .on('error', function(err){
            console.log(err)
        });
    //return;
});


gulp.task('browser-sync', function() {
    browserSync.init({
        proxy: "http://dev.craft3starter.com"
    });
});

gulp.task('bs-reload', function () {
    browserSync.reload();
});


gulp.task('watch', ['browser-sync'], function () {
    browserSync.notify("Compiling, please wait");
    gulp.watch("src/scss/**.scss", ['css']);
    gulp.watch("src/js/**.js", ['js']);
    gulp.watch('./craft/templates/**/*.*', ['bs-reload']);
});

var img_paths = {
  files: './craft/web/assets/images/**/*.{gif,jpg,png}',
  filesDest: './craft/web/assets/images',
};

// Optimize Images task
gulp.task('img', function() {
  return gulp.src(img_paths.files, { base: './craft/web/assets/images'} )
    .pipe(imagemin({
        progressive: true,
        interlaced: true,
        svgoPlugins: [ {removeViewBox:false}, {removeUselessStrokeAndFill:false} ]
    }))
    .pipe(gulp.dest(img_paths.filesDest))
});

// error function for plumber
var onError = function (err) {
  gutil.beep();
  console.log(err);
  this.emit('end');
};

gulp.task('default', ['css', 'js']);
gulp.task('images', ['img']);