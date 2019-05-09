const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

const webpack = require('webpack')
/**
 * Automatically load modules instead of having to import or require them everywhere.
 * Support by webpack. To get more information:
 *
 * https://webpack.js.org/plugins/provide-plugin/
 * http://j.mp/2JzG1Dm
 */
environment.plugins.prepend(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        jquery: 'jquery',
        'window.jQuery': 'jquery',
        Popper: ['popper.js', 'default']
    })
)



/**
 * To use jQuery in views

 https://gist.github.com/andyyou/834e82f5723fec9d2dc021fb7b819517

 yarn add expose-loader -D

environment.loaders.append('expose', {
    test: require.resolve('jquery'),
    use: [{
        loader: 'expose-loader',
        options: '$'
    }]
})

 */

module.exports = environment