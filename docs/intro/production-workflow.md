# Production workflow

The following steps describe the intended release process and optional services to use (e.g. Travis).

## Handle extension version

If you take a look to your `src/manifest.json`, you will see that `version` is `null`.

This is perfectly normal. The version is automatically injected when building the extension, by taking the `version` from your `package.json`. You should not update `manifest.json`'s directly.

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
2. Using `npm version` or `yarn version` will update your `package.json`, create a new commit and a new tag, this is really helpful!
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

If you are using [Travis](https://travis-ci.com/), you can setup [GitHub Releases upload](https://docs.travis-ci.com/user/deployment/releases/) in order to automatically build a zip of your extension and attach it to your GitHub releases ([example](https://github.com/Kocal/Solary/releases/tag/v1.9.0)):

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

## Automatic build and release with GitHub Actions

If you are using [GitHub Actions](https://github.com/features/actions), you can easily automatically build a zip of your extension and create a new GitHub release, each time a new tag is pushed.

```yml
on:
    push:
        tags:
            - 'v*' # Push events to matching v*, i.e. v1.0, v20.15.10

name: Release

jobs:
    build:
        name: Create Release
        runs-on: ubuntu-latest
        steps:
            -   uses: actions/checkout@v2
            -   run: |
                    git fetch --prune --unshallow

            -   name: Install Node.js
                uses: actions/setup-node@v1
                with:
                    node-version: 12.x

            -   run: yarn install --frozen-lockfile

            -   run: yarn build

            -   run: yarn build-zip

            -   name: Create Release
                id: create_release
                uses: actions/create-release@v1
                env:
                    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
                with:
                    tag_name: ${{ github.ref }}
                    release_name: Release ${{ github.ref }}

            -   name: Upload Assets to Release with a wildcard
                uses: csexton/release-asset-action@v2
                with:
                    pattern: "dist-zip/*.zip"
                    github-token: ${{ secrets.GITHUB_TOKEN }}
                    release-url: ${{ steps.create_release.outputs.upload_url }}
```