# Using Vue Devtools in Your Popup

By default, you can't use [Vue Devtools](https://github.com/vuejs/vue-devtools) on your popup page. The issue has already been [discussed](https://github.com/vuejs/vue-devtools/issues/120) in Vue Devtools repository.

The GitHub user [@wujunchuan](https://github.com/wujunchuan) found a solution to make it works anyway.

## Install and Run Vue Devtools

Install Vue Devtools (e.g.: `npm i -g @vue/devtools`) and then run `vue-devtools`.

## Configuring Your Extension

A new window opens, copy the first `<script>` (it should be something like `<script src="http://localhost:8098"></script>`).

### Updating your .html

Then update your `public/browser-extension.html` like this:

``` diff
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <title><%= htmlWebpackPlugin.options.title %></title>
+  <% if (process.env.NODE_ENV === 'development') { %>
+    <!-- Load Vue Devtools remote ONLY in development -->
+    <script src="http://localhost:8098"></script>
+  <% } %>
</head>
<body>
  <div id="app"></div>
</body>
</html>

```

### Updating Content Security Policy

You also need to update Content Security Policy of your extension. For this, update your `vue.config.js` and use the option `manifestTransformer` from [`vue-cli-plugin-browser-extension`'s options](https://github.com/adambullmer/vue-cli-plugin-browser-extension#plugin-options).

```js
// vue.config.js
module.exports = {
  pages: {
    // ...
  },
  pluginOptions: {
    browserExtension: {
      // ...
      manifestTransformer: (manifest) => {
        if (process.env.NODE_ENV !== 'production') {
          manifest.content_security_policy = manifest.content_security_policy.replace('script-src', 'script-src http://localhost:8098');
        }
        
        return manifest;
      }
    }
  }
}

```

::: tip Tips
1. If running webpack in watch mode, you need to stop and restart webpack to apply configuration changes.
2. You should disable and re-enable your extension in Chrome, to take care of `manifest.json` changes.
:::

### Opening Your Popup

After that, you can inspect your popup and you will see a message like `Connected to Vue.js devtools`.
