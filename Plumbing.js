var all      = require('plumber-all');
var concat   = require('plumber-concat');
var glob     = require('plumber-glob');
var myth     = require('plumber-myth');
var write    = require('plumber-write');

module.exports = function(pipelines) {

    pipelines['css'] = [
        glob('_includes/**/*.pre.css'),
        myth(),
        concat('style'),
        write('assets/stylesheets')
    ];

};