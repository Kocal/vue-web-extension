const path = require('path');
const { addTestAnswers } = require('./scenarios');
const { sortDependencies, installDependencies, printMessage, runLintFix, runPrettierWrite } = require('./utils');

module.exports = {
  "metalsmith": {
    // When running tests for the template, this adds answers for the selected scenario
    "before": addTestAnswers
  },
  "prompts": {
    "name": {
      "when": "isNotTest",
      "type": "string",
      "required": true,
      "message": "Project name"
    },
    "description": {
      "when": "isNotTest",
      "type": "string",
      "required": false,
      "message": "Project description",
      "default": "A Vue.js web extension"
    },
    "author": {
      "when": "isNotTest",
      "type": "string",
      "message": "Author"
    },
    "router": {
      "when": "isNotTest",
      "type": "confirm",
      "message": "Install vue-router?"
    },
    "store": {
      "when": "isNotTest",
      "type": "confirm",
      "message": "Install vuex?"
    },
    "axios": {
      "when": "isNotTest",
      "type": "confirm",
      "message": "Install axios?"
    },
    "lint": {
      "when": "isNotTest",
      "type": "confirm",
      "message": "Install ESLint?"
    },
    "lintConfig": {
      "when": "isNotTest && lint",
      "type": 'list',
      "message": 'Pick an ESLint preset',
      "choices": [
        {
          "name": 'Standard (https://github.com/standard/standard)',
          "value": 'standard',
          "short": 'Standard',
        },
        {
          "name": 'Airbnb (https://github.com/airbnb/javascript)',
          "value": 'airbnb',
          "short": 'Airbnb',
        },
        {
          "name": 'none (configure it yourself)',
          "value": 'none',
          "short": 'none',
        }
      ]
    },
    "prettier": {
      "when": "isNotTest",
      "type": "confirm",
      "message": "Install Prettier?"
    },
    "prettierHook": {
      "when": "isNotTest && prettier",
      "type": "confirm",
      "message": "Setup a git precommit hook that will automatically run Prettier on .vue and .js files"
    },
    "autoInstall": {
      "when": "isNotTest",
      "type": "list",
      "message": "Automatically install dependencies?",
      "choices": [
        {
          "name": "Yes, use NPM",
          "value": "npm",
          "short": "npm",
        },
        {
          "name": "Yes, use Yarn",
          "value": "yarn",
          "short": "yarn",
        },
        {
          "name": "No, I will handle that myself",
          "value": false,
          "short": "no",
        },
      ]
    }
  },
  "filters": {
    ".eslintrc.js": "lint",
    ".prettierc": "prettier",
    "src/store/**/*": "store",
    "src/popup/router/**/*": "router"
  },
  "complete": function (data, { chalk }) {
    const { green, red } = chalk;
    const cwd = path.join(process.cwd(), data.inPlace ? '' : data.destDirName);

    sortDependencies(data);

    if (data.autoInstall !== false) {
      installDependencies(cwd, data.autoInstall, green)
        .then(() => runLintFix(cwd, data, green))
        .then(() => runPrettierWrite(cwd, data, green))
        .then(() => printMessage(data, chalk))
        .catch(e => console.log(red('Error :'), e));
    } else {
      printMessage(data, chalk);
    }
  },
};
