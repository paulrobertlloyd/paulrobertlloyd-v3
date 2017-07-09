import babel from 'rollup-plugin-babel';
import commonjs from 'rollup-plugin-commonjs';
import resolve from 'rollup-plugin-node-resolve';
import uglify from 'rollup-plugin-uglify';

export default {
  entry: 'src/_assets/javascripts/global.js',
  dest: 'www/assets/javascripts/global.js',
  format: 'iife',
  sourceMap: true,
  sourceMapFile: 'www/assets/javascripts/global.map.js',
  plugins: [
    babel({
      exclude: 'node_modules/**'
    }),
    commonjs(),
    resolve({
      browser: true,
      jsnext: true,
      main: true
    }),
    uglify()
  ]
};
