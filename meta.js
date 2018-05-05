const { addTestAnswers } = require('./scenarios')

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
    }
  },
  "filters": {
    ".eslintrc.js": "lint",
    ".prettierc": "prettier",
    "src/store/**/*": "store",
    "src/popup/router/**/*": "router"
  },
  "completeMessage": "To get started:\n\n  {{^inPlace}}cd {{destDirName}}\n  {{/inPlace}}npm install{{#lint}}\n  npm run lint --fix{{/lint}}\n  npm run build"
};
