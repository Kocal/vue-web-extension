# Production workflow

The following steps describe the intended release process and optional services to use (e.g. Travis).


## Handle extension version

If you take a look to your `src/manifest.json`, you will see that `version` is `null`.

When building, it injects the version of your `package.json` in your `src/manifest.json`. That means you should not update `manifest.json`'s directly.

By doing this, it means that you could use one of the following commands to easily update your version:

```bash
npm version major # 1.x.x -> 2.x.x, when you release a breaking change
npm version minor # x.1.x -> x.2.x, when you release a feature
npm version patch # x.x.1 -> x.x.2, when you release a patch
npm version 1.2.3 # custom version

# for yarn:
yarn version --major
yarn version --minor
yarn version --patch
yarn version --new-version 1.2.3
```

::: tip Tips
1. It is recommended to follow [Sementic Versioning](https://semver.org/) rules!
2. Using `npm version` or `yarn version` will create update your `package.json`, create a new commit and a new tag, this is really helpful!
:::


## Building for production

Once you have updated your version, you can run:

```bash
npm run build
npm run build-zip

# for yarn:
yarn build
yarn build-zip
```

Those commands will:

- build your extension for production (and use your `package.json` version for your `manifest.json`), located in `dist/`
- build a `.zip`, located in `dist/zip/<your-extension-name>-<version>.zip`

When publishing on the [Chrome Web Store](https://chrome.google.com/webstore) (or [Firefox Add-ons](https://addons.mozilla.org)), you should upload your fresh `.zip`!


## Automatic build and release with Travis

If you are using [Travis](https://travis-ci.com/), you can setup [GitHub Releases upload](https://docs.travis-ci.com/user/deployment/releases/) in order to automatically build a zip of your extension and attach it to your GitHub releases ([example](https://github.com/Kocal-Web-Extensions/Solary/releases/tag/v1.9.0)):

```yaml
script:
  - yarn build
  - yarn build-zip

before_deploy:
  - export RELEASE_EXTENSION_FILE=$(ls dist-zip/*.zip)
  - echo "Deploying ${RELEASE_EXTENSION_FILE} to GitHub releases"

deploy:
  provider: releases
  api_key:
    secure: <YOUR API KEY>
  file: '${RELEASE_EXTENSION_FILE}'
  skip_cleanup: true # To keep, otherwise your `.zip` will be cleaned
  on:
    repo: <YOUR REPO>
    tags: true # Only on a new git tag
```

This is really useful if you don't want to manually run commands from [Building for production](https://vue-web-extension.netlify.app/intro/production-workflow#building-for-production).