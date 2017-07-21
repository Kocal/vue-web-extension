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
    }
  },
  "filters": {
    "src/store/**/*": "store",
    "src/popup/router/**/*": "router"
  },
  "completeMessage": "To get started:\n\n  {{^inPlace}}cd {{destDirName}}\n  {{/inPlace}}npm install\n  npm run build"
};
