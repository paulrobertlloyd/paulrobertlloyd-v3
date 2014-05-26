var all      = require('plumber-all');
var concat   = require('plumber-concat');
var glob     = require('plumber-glob');
var myth     = require('plumber-myth');
var write    = require('plumber-write');

module.exports = function(pipelines) {

    pipelines['dev:css'] = [
        glob('source/_includes/**/*.pre.css'),
        concat('style'),
        myth('style'),
        write('source/assets/stylesheets')
    ];

    pipelines['prod:css'] = [
        glob('source/_includes/**/*.pre.css'),
        concat('style'),
        myth('style'),
        write('public/assets/stylesheets')
    ];

};