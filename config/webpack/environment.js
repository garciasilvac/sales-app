const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({
$: 'jquery',
jquery: 'jquery',
jQuery: 'jquery',
Popper: ['popper.js', 'default'],
moment: 'moment/min/moment.min.js',
'tempusdominus-bootstrap': 'tempusdominus-bootstrap/build/js/tempusdominus-bootstrap.min.js'
}))

module.exports = environment
