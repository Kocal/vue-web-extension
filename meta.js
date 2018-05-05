module.exports = {
  "prompts": {
    "name": {
      "type": "string",
      "required": true,
      "message": "Project name"
    },
    "description": {
      "type": "string",
      "required": false,
      "message": "Project description",
      "default": "A Vue.js web extension"
    },
    "author": {
      "type": "string",
      "message": "Author"
    },
    "router": {
      "type": "confirm",
      "message": "Install vue-router?"
    },
    "store": {
      "type": "confirm",
      "message": "Install vuex?"
    },
    "axios": {
      "type": "confirm",
      "message": "Install axios?"
    },
    "lint": {
      "type": "confirm",
      "message": "Install ESLint?"
    },
    "lintConfig": {
      "when": "lint",
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
