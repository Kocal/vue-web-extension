# Development Workflow

Below you find the basic steps of the intended development workflow.


## Watching mode and Hot Module Reload

Watching for modifications can be done using `npm run build:dev`.

It also enables [Hot Module Reloading](https://webpack.js.org/concepts/hot-module-replacement), using the [webpack-extension-reloader](https://github.com/rubenspgcavalcante/webpack-extension-reloader) plugin.

::: tip
Keep in mind that HMR only works for your **background** entry.
:::


## Build a development version of the extension

Run `npm run build:dev` to build the extension into `dist` folder for **development**. This build isn't intended to be released. To get a release-ready zip-file see the instructions on the [production-workflow](/intro/production-workflow.html).