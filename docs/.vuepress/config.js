module.exports = {
  title: 'Vue Web-Extension - A Web-Extension preset for VueJS',
  description: '🛠️ A boilerplate for quickly starting a web extension with Vue, webpack 4, ESLint and more!',

  plugins: {
    'sitemap': { hostname: 'https://vue-web-extension.netlify.app/', changefreq: 'monthly' },
    'seo': {},

    '@vuepress/pwa': {
      serviceWorker: true,
      updatePopup: false
    }
  },
  serviceWorker: true,

  themeConfig: {
    domain: 'https://vue-web-extension.netlify.app/',
    repo: 'Kocal/vue-web-extension',
    docsDir: 'docs',
    editLinks: true,
    lastConfig: 'Last updated',
    serviceWorker: {
      updatePopup: true,
    },
    smoothScroll: true,
    sidebar: [
      {
        title: 'Intro',
        collapsable: false,
        children: [
          'intro/setup',
          'intro/development-workflow',
          'intro/production-workflow',
        ],
      },
      {
        title: 'Development',
        collapsable: false,
        children: [
          'development/Vue-Devtools',
          'development/TailwindCSS',
        ],
      },
      {
        title: 'Support',
        collapsable: false,
        children: [
          'support',
        ],
      },
    ]
  }
};
