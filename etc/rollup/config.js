import babel from 'rollup-plugin-babel';
import commonjs from 'rollup-plugin-commonjs';
import resolve from 'rollup-plugin-node-resolve';
import uglify from 'rollup-plugin-uglify';

export default {
  entry: 'src/assets/javascripts/main.js',
  dest: 'www/assets/javascripts/main.js',
  format: 'iife',
  sourceMap: true,
  sourceMapFile: 'www/assets/javascripts/main.map.js',
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
