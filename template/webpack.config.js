const webpack = require('webpack');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const WebpackShellPlugin = require('webpack-shell-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const { VueLoaderPlugin } = require('vue-loader');
const { version } = require('./package.json');

const config = {
  mode: process.env.NODE_ENV,
  context: __dirname + '/src',
  entry: {
    'background': './background.js',
    'popup/popup': './popup/popup.js',
  },
  output: {
    path: __dirname + '/dist',
    filename: '[name].js',
  },
  resolve: {
    extensions: ['.js', '.vue'],
  },
  module: {
    rules: [
      {
        test: /\.vue$/,
        loaders: 'vue-loader',
      },
      {
        test: /\.js$/,
        loader: 'babel-loader',
        exclude: /node_modules/,
      },
      {
        test: /\.css$/,
        use: ExtractTextPlugin.extract({
          use: 'css-loader',
          fallback: 'vue-style-loader',
        }),
      },
      {
        test: /\.scss$/,
        use: ExtractTextPlugin.extract({
          use: 'css-loader!sass-loader',
          fallback: 'vue-style-loader',
        }),
      },
      {
        test: /\.sass$/,
        use: ExtractTextPlugin.extract({
          use: 'css-loader!sass-loader?indentedSyntax',
          fallback: 'vue-style-loader',
        }),
      },
      {
        test: /\.(png|jpg|gif|svg|ico)$/,
        loader: 'file-loader',
        options: {
          name: '[name].[ext]?emitFile=false',
        },
      },
    ],
  },
  plugins: [
    new VueLoaderPlugin(),
    new ExtractTextPlugin({
      filename: '[name].css',
    }),
    new CopyWebpackPlugin([
      { from: 'icons', to: 'icons', ignore: ['icon.xcf'] },
      { from: 'popup/popup.html', to: 'popup/popup.html' },
      {
        from: 'manifest.json',
        to: 'manifest.json',
        transform: (content) => {
          const jsonContent = JSON.parse(content);
          jsonContent.version = version;

          if (config.mode === 'development') {
            jsonContent['content_security_policy'] = "script-src 'self' 'unsafe-eval'; object-src 'self'";
          }

          return JSON.stringify(jsonContent, null, 2);
        },
      },
    ]),
    new WebpackShellPlugin({
      onBuildEnd: ['node scripts/remove-evals.js'],
    }),
  ],
};

if (config.mode === 'production') {
  config.plugins = (config.plugins || []).concat([
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: '"production"',
      },
    }),
  ]);
}

module.exports = config;
