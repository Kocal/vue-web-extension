# Adding TailwindCSS Support

Using [TailwindCSS](https://tailwindcss.com/) is optional and needs to be configured, if desired. To style your extension popup or options page using Tailwind, you will need to install the required dependencies and configure the webpack build steps.

Below you find the required steps to integrate TailwindCSS to your web extension.

## 1. Installation

### 1. Automatic, via a Vue CLI plugin

You can use a Vue CLI plugin, for example [vue-cli-plugin-tailwind](https://www.npmjs.com/package/vue-cli-plugin-tailwind) or [@64robots/vue-cli-plugin-tailwind](https://www.npmjs.com/package/@64robots/vue-cli-plugin-tailwind) npm packages.

### 2. Manual installation

Or you can do the installation steps manually.

Install dependency `tailwindcss`:

``` bash
# with npm:
npm install tailwindcss

# using yarn:
yarn add tailwindcss
```
Then initialize Tailwind by calling `./node_modules/.bin/tailwind init`, it will create a `tailwind.config.js` file.

## 2. Configuring PostCSS

You must configure PostCSS by adding the Tailwind's plugin:

```js
// postcss.config.js
module.exports = {
  plugins: [
    // ...
    require('tailwindcss'),
    require('autoprefixer'), // if you have installed `autoprefixer`
    // ...
  ]
}
```

## 3. Controlling File Size

Your generated CSS files can be really big when using Tailwind. 

To prevent that when building for production, you must use Tailwind's `purge` option to tree-shake unused styles
and optimize your final build size.

```js
// tailwind.config.js
module.exports = {
  purge: {
    // Specify the paths to all of the template files in your project
    content: ['src/**/*.vue'],
  
    // Whitelist selectors by using regular expression
    whitelistPatterns: [
        /-(leave|enter|appear)(|-(to|from|active))$/, // transitions
        /data-v-.*/, // scoped css
    ],
  }
  // ...
}
```
 
## 4. Usage

To make the Tailwind classes available you need to add the following lines to your `src/popup/App.vue`-file:

``` vue
<style>
/* basic styles */
html {
  width: 400px;
  height: 400px;
}

/* purgecss start ignore */
@tailwind base;
@tailwind components;
/* purgecss end ignore */

@tailwind utilities;
</style>
```

In a similar way you can add it to the options page of course.

Now you should be able to use the commonly used Tailwind classes in your web-extension.
