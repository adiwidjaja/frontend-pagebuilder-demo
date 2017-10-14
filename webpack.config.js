var ExtractTextPlugin = require('extract-text-webpack-plugin');
var webpack = require('webpack');

module.exports = {
    context: __dirname,
    entry: {
        main: [
            // 'webpack-dev-server/client?http://localhost:8080',
            './mysite/src/main.js'
        ],
        editor: [
            './mysite/src/scss/editor.scss'
        ]
    },
    output: {
        filename: 'js/[name].js',
        // publicPath: '/assets/',
        path: './mysite/'
    },
    devtool: 'source-map',
    jshint: {
        esversion: 6
    },
    module: {
        preLoaders: [{
          test: /\.js$/,
          exclude: /node_modules/,
          loader: 'jshint-loader'
        }],
        loaders: [
            {
                test: /\.scss|\.css$/,
                loader: ExtractTextPlugin.extract('css?sourceMap!sass', {'publicPath':'../'})
                // loader: ExtractTextPlugin.extract('style-loader', 'css-loader?sourceMap!sass-loader?outputStyle=expanded&sourceMap=true&sourceMapContents=true', {'publicPath':'../'})
            },
            {
                test: /\.jpg|\.png|\.svg$/,
                loader: "file-loader?name=images/[name].[ext]"
            },
            {
                test   : /\.(ttf|eot|woff(2)?)(\?[a-z0-9]+)?$/,
                loader: "file-loader?name=fonts/[name].[ext]&context=./something",
            },
            {
                test: /\.js|\.jsx$/,
                loader: 'babel-loader',
                query: {
                    presets: ['es2015']
                }
            }
        ]
    },
    plugins: [
        new ExtractTextPlugin('css/[name].css', {
            // allChunks: true,
            devtool: "source-map"
        }),
        new webpack.DefinePlugin({
          "process.env": {
             NODE_ENV: JSON.stringify("production")
           }
        })
        // ,
        // new webpack.ProvidePlugin({
        //     $: 'jquery',
        //     jQuery: 'jquery',
        //     'window.jQuery': 'jquery'
        // })
    ]
};

