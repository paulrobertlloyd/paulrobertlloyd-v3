var all      = require('plumber-all');
var concat   = require('plumber-concat');
var glob     = require('plumber-glob');
var myth     = require('plumber-myth');
var write    = require('plumber-write');

module.exports = function(pipelines) {

    pipelines['dev:css'] = [
        glob('_includes/**/*.pre.css'),
        concat('style'),
        myth('style'),
        write('_site/assets/stylesheets')
    ];

    pipelines['prod:css'] = [
        glob('_includes/**/*.pre.css'),
        concat('style'),
        myth('style'),
        write('assets/stylesheets')
    ];

};