# vue-web-extension

[![Build Status (Travis)](https://travis-ci.org/Kocal/vue-web-extension.svg?branch=master)](https://travis-ci.org/Kocal/vue-web-extension)
[![Build Status (AppVeyor)](https://ci.appveyor.com/api/projects/status/huaoxwvqcoyx2x08/branch/master?svg=true)](https://ci.appveyor.com/project/Kocal/vue-web-extension/branch/master)

This template allows you to quickly start a web extension containing:

- Boilerplate for `manifest.json` and `background.js` files, and for `icons` / `popup` folders
- [Vue](https://github.com/vuejs/vue)
- [Vue-router](https://github.com/vuejs/vue-router) (configurable)
- [Vuex](https://github.com/vuejs/vuex) (configurable)
- [Axios](https://github.com/axios/axios) (configurable)
- [Webpack 4](https://github.com/webpack/webpack)
- [Babel](https://github.com/babel/babel) with [preset-env](https://github.com/babel/babel/tree/master/packages/babel-preset-env)
- [ESLint](https://github.com/eslint/eslint) (configurable)
- [Prettier](https://github.com/prettier/prettier) (configurable)
- A git precommit hook for running Prettier by using [pretty-quick](https://github.com/azz/pretty-quick) or [precise-commits](https://github.com/nrwl/precise-commits) (configurable)
- CSS extraction, with [mini-css-extract-plugin](https://github.com/webpack-contrib/mini-css-extract-plugin)
- Compliable with the **C**ontent **S**ecurity **P**olicy of Chrome and Firefox web stores (some usages [`eval`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval) are removed)
- A script to package your extension into a `.zip` file

## Requirements

- Node.js >= 8 and npm >= 5
- [git](https://git-scm.com)
- [vue-cli 2](https://github.com/vuejs/vue-cli/tree/v2)

## Usage

```bash
$ vue init kocal/vue-web-extension my-extension
$ cd my-extension
$ npm install
$ npm run build
```

### `npm run build`

Build the extension into `dist` folder for **production**.

### `npm run build:dev`

Build the extension into `dist` folder for **development**.

### `npm run watch`

Watch for modifications then run `npm run build`.

### `npm run watch:dev`

Watch for modifications then run `npm run build:dev`.

It also enable [Hot Module Reloading](https://webpack.js.org/concepts/hot-module-replacement), thanks to [webpack-chrome-extension-reloader](https://github.com/rubenspgcavalcante/webpack-chrome-extension-reloader) plugin.

:warning: Keep in mind that HMR only works for your **background** entry.

### `npm run build-zip`

Build a zip file following this format `<name>-v<version>.zip`, by reading `name` and `version` from `manifest.json` file.
Zip file is located in `dist-zip` folder.
