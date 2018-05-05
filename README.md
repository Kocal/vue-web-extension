# vue-web-extension-boilerplate

[![Build Status](https://travis-ci.org/Kocal/vue-web-extension.svg?branch=master)](https://travis-ci.org/Kocal/vue-web-extension)

This template allows you to quickly start a web extension containing:

- Boilerplate for `manifest.json` and `background.js` files, and for `icons` / `popup` folders,
- Vue,
- Vue-router (configurable),
- Vuex (configurable),
- Axios (configurable),
- [Babel](https://github.com/babel/babel) with [preset-env](https://github.com/babel/babel/tree/master/packages/babel-preset-env),
- [ESLint](https://github.com/eslint/eslint) (configurable),
- [Prettier](https://github.com/prettier/prettier) (configurable),
- [Webpack 4](https://github.com/webpack/webpack),
- CSS extraction,
- A script for removing `eval` usages to comply with the Content Security Policy of Chrome/Firefox web store, is automatically called for each build,
- A script to package your extension into a `.zip` file.

## Requirements

- Node.js >= 6 and npm >= 3,
- [git](https://git-scm.com),
- [vue-cli](https://github.com/vuejs/vue-cli)

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

### `npm run build-zip`

Build a zip file following this format `<name>-v<version>.zip`, by reading `name` and `version` from `manifest.json` file.
Zip file is located in `dist-zip` folder.
