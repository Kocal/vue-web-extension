# vue-web-extension

[![Build Status (Travis)](https://travis-ci.org/Kocal/vue-web-extension.svg?branch=master)](https://travis-ci.org/Kocal/vue-web-extension)
[![Build Status (AppVeyor)](https://ci.appveyor.com/api/projects/status/huaoxwvqcoyx2x08/branch/master?svg=true)](https://ci.appveyor.com/project/Kocal/vue-web-extension/branch/master)

:warning: This README is for the master version of the preset. If you use the v1 of this boilerplate with Vue-CLI 2 support, please see [`v1` branch](https://github.com/Kocal/vue-web-extension/tree/v1).

---

This Vue CLI preset allows you to quickly start a web extension containing:

- Everything you need to build a web extension (`manifest.json`, `.zip` building, ...), thanks to [adambullmer/vue-cli-plugin-browser-extension](https://github.com/adambullmer/vue-cli-plugin-browser-extension)
- [Vue 2+](https://github.com/vuejs/vue)
- [Vue-router](https://github.com/vuejs/vue-router) and [Vuex](https://github.com/vuejs/vuex)
- [Axios](https://github.com/axios/axios) (configurable)
- [Babel](https://github.com/babel/babel) with [preset-env](https://github.com/babel/babel/tree/master/packages/babel-preset-env)
- [ESLint](https://github.com/eslint/eslint) and [Prettier](https://github.com/prettier/prettier) (both configurable)

## Requirements

- Node.js >= 10 and npm >= 5
- [git](https://git-scm.com)
- [vue-cli 3+](https://github.com/vuejs/vue-cli)

## Documentation

The documentation can be found on [vue-web-extension.netlify.app](https://vue-web-extension.netlify.app/). Please check the documentation website and the [open and closed issues](https://github.com/Kocal/vue-web-extension/issues?q=), before raising a new issue.

## Usage

```bash
$ vue create --preset kocal/vue-web-extension my-extension
$ cd my-extension
$ npm run build
```

### `npm run build`

Build the extension into `dist` folder for **production**.

A zip file is also built and is located in `artifacts` directory.

### `npm run serve`


Build the extension for **development** and watch over file changes.

It also automatically reload your extension into your browsers, thanks to [webpack-extension-reloader](https://github.com/rubenspgcavalcante/webpack-extension-reloader) plugin.

## Options

See https://github.com/adambullmer/vue-cli-plugin-browser-extension#plugin-options
