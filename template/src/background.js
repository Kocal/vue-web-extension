{{#if mozillaPolyfill}}global.browser = require('webextension-polyfill'){{/if}}
{{#if store}}
import store from './store'

alert(`Hello ${store.getters.foo}!`)
{{else}}
alert('Hello world!')
{{/if}}

