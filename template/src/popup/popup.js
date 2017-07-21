import Vue from 'vue';
import App from './App.vue';
{{#if store}}import store from './../store';{{/if}}
{{#if router}}import router from './router';{{/if}}

new Vue({
  el: '#app',
  {{#if store}}store,{{/if}}
  {{#if router}}router,{{/if}}
  render: h => h(App)
});
