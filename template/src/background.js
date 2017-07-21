{{#if store}}import store from './store';{{/if}}

alert(`Hello ${store.getters.foo}!`);
