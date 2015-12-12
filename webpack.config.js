var webpack = require('webpack');

// postcss plugins
var cssimport = require('postcss-import');
var customProperties = require('postcss-custom-properties');
var autoprefixer = require('autoprefixer');
var csswring = require('csswring');
var cssnested = require('postcss-nested');
var progressBarPlugin = require('progress-bar-webpack-plugin');

module.exports = {
  entry: {
    app : ['./src/index.js']
  },
  output: {
    path: __dirname + '/build/',
    filename: 'bundle.js'
  },
  devtool: 'eval',
  debug: true,
  plugins: [
    progressBarPlugin(),
    new webpack.ProvidePlugin({riot: 'riot'})
  ],
  module: {
    preLoaders: [
      { test: /\.tag$/, exclude: /node_modules/, loader: 'riotjs-loader', query: { type: 'none' } }
    ],
    loaders: [
      { test: /\.js|\.tag$/, exclude: /node_modules/, include: /src/, loader: 'babel-loader', query: {presets: ['es2015']} },
      { test: /\.css$/, loader: 'style-loader!css-loader!postcss-loader' }
    ]
  },
  postcss: [cssimport, cssnested, customProperties, autoprefixer, csswring],
  devServer: {
    contentBase: './build/',
    port: 1337,
    hot: true,
    inline: true
  }
};