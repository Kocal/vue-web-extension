# Using Vue Devtools in Your Popup

By default, you can't use [Vue Devtools](https://github.com/vuejs/vue-devtools) on your popup page. The issue has already been [discussed](https://github.com/vuejs/vue-devtools/issues/120) in Vue Devtools repository.

The GitHub user [@wujunchuan](https://github.com/wujunchuan) found a solution to make it works anyway.

## Install and Run Vue Devtools

Install Vue Devtools (e.g.: `npm i -g @vue/devtools`) and then run `vue-devtools`.

## Configuring Your Extension

A new window opens, copy the first `<script>` (it should be something like `<script src="http://localhost:8098"></script>`).


### Updating your .html

Then update your `src/popup/popup.html` like this:

``` diff
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="popup.css">
+ <% if (NODE_ENV === 'development') { %>
+   <!-- Load Vue Devtools remote ONLY in development -->
+   <script src="http://localhost:8098"></script>
+ <% } %>
</head>
...
```

::: tip
Since [#336](https://github.com/Kocal/vue-web-extension/pull/336), it is now possible to use [EJS](http://ejs.co/) on HTML files. Also it automatically inject all environment variables from `process.env`.
:::


### Updating Content Security Policy

You also need to update Content Security Policy of your extension. For this, update your `webpack.config.js` by adding `http://localhost:8098` in `manifest.json`'s `content_security_policy`:

``` diff
{
  from: 'manifest.json',
  to: 'manifest.json',
  transform: (content) => {
    const jsonContent = JSON.parse(content);
    jsonContent.version = version;

    if (config.mode === 'development') {
-      jsonContent['content_security_policy'] = "script-src 'self' 'unsafe-eval'; object-src 'self'";
+      jsonContent['content_security_policy'] = "script-src 'self' 'unsafe-eval' http://localhost:8098; object-src 'self'";
    }

    return JSON.stringify(jsonContent, null, 2);
},
```

::: tip Tips
1. If running webpack in watch mode, you need to stop and restart webpack to apply configuration changes.
2. You should disable and re-enable your extension in Chrome, to take care of `manifest.json` changes.
:::

### Opening Your Popup

After that, you can open your popup and normally you will see a message like `Connected to Vue.js devtools`.

To make your development easier, you can open your popup in a new tab: `chrome-extension://<extension id>/popup/popup.html`.
