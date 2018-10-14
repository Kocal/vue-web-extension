{{#if mozillaPolyfill}}global.browser = require('webextension-polyfill'){{/if}}

import Vue from 'vue'
import App from './App'

/* eslint-disable no-new */
new Vue({
  el: '#app',
  render: h => h(App)
})
