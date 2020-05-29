# Adding TailwindCSS Support

Using [TailwindCSS](https://tailwindcss.com/) is optional and needs to be configured, if desired. To style your extension popup or options page using Tailwind, you will need to install the required dependencies and configure the webpack build steps.

Below you find the required steps to configure Vue-Web-Extension for TailwindCSS.

1. Install dependencies `postcss-loader @fullhuman/postcss-purgecss`:

    ``` bash
    # with npm:
    npm install postcss-loader @fullhuman/postcss-purgecss tailwindcss --only=dev

    # using yarn:
    yarn add postcss-loader @fullhuman/postcss-purgecss tailwindcss --dev
    ```

2. Update your `webpack.config.js` to use `postcss-loader`:

    ``` diff
        {
            test: /\.css$/,
    +        use: [MiniCssExtractPlugin.loader, 'css-loader', 'postcss-loader'],
    -        use: [MiniCssExtractPlugin.loader, 'css-loader'],
        },
    ```

3.  Create a file called `postcss.config.js` next to your `webpack.config.js` with the following contents:

    ``` js
    /* eslint-disable import/no-extraneous-dependencies */
    const tailwindcss = require('tailwindcss');

    const purgecss = require('@fullhuman/postcss-purgecss')({
        // Specify the paths to all of the template files in your project
        content: ['./src/**/*.vue'],

        // Include any special characters you're using in this regular expression
        defaultExtractor: (content) => content.match(/[\w-/:]+(?<!:)/g) || [],

        extractors: [
            // https://purgecss.com/guides/vue.html
            {
                extensions: ['vue'],
                extractor(content) {
                    const contentWithoutStyleBlocks = content.replace(/<style[^]+?<\/style>/gi, '');
                    return contentWithoutStyleBlocks.match(/[A-Za-z0-9-_/:]*[A-Za-z0-9-_/]+/g) || [];
                },
            },
        ],

        whitelist: [],
        whitelistPatterns: [
            /-(leave|enter|appear)(|-(to|from|active))$/, // transitions
            /data-v-.*/, // scoped css
        ],
    });

    module.exports = {
        plugins: [tailwindcss(), ...(process.env.NODE_ENV === 'production' ? [purgecss] : [])],
    };
    ```

4. Add Tailwind Directives:

    To make the Tailwind classes available you need to add the following lines to your `src/popup/App.vue`-file:

    ``` vue
    <style>
    @tailwind base;
    @tailwind components;
    @tailwind utilities;
    </style>
   ```

   In a similar way you can add it to the options page of course.

Now you should be able to use the commonly used Tailwind classes in your web-extension.