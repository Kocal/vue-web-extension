module.exports = api => {
  api.extendPackage({
    description: api.options.description
  });

  if (api.options.axios) {
    api.extendPackage({
      dependencies: {
        axios: '^0.20.0',
      },
    });
  }
};
