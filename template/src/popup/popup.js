{{#if mozillaPolyfill}}global.browser = require('webextension-polyfill'){{/if}}

import Vue from 'vue'
import App from './App'
{{#if store}}import store from '../store'{{/if}}
{{#if router}}import router from './router'{{/if}}

/* eslint-disable no-new */
new Vue({
  el: '#app',
  {{#if store}}store,{{/if}}
  {{#if router}}router,{{/if}}
  render: h => h(App)
})
