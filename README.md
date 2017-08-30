# vue-web-extension-boilerplate

This template allows you to quickly start a web extension containing:

- Boilerplate for `manifest.json` and `background.js` files, and for `icons` / `popup` folders,
- Vue,
- Vue-router (configurable),
- Vuex (configurable),
- Webpack,
- CSS extraction,
- A Bash script for removing `eval` usages to comply with the Content Security Policy of Chrome/Firefox web store, is automatically called at each build,
- A Python script to automatically bundle your extension into a zip file.

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

### `npm run watch`

Watch for modifications then run `npm run build`

### `npm run build` 

Build the extension into `dist` folder.

### `npm run build-zip`

Build a zip file following this format `<name>-v<version>.zip`, by reading `name` and `version` from `manifest.json` file.
Zip file is located in `dist-zip` folder.