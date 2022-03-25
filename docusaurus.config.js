// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
  i18n: {
    defaultLocale: "en",
    locales: ["en"],
  },

  title: 'Camino Docs',
  tagline: 'Documentation and Tutorials for Camino',
  url: 'https://docs.camino.foundation',
  baseUrl: '/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.png',
  organizationName: 'chain4travel', // Usually your GitHub org/user name.
  projectName: 'camino-docs', // Usually your repo name.
  themes: ['docusaurus-theme-search-typesense'],

  presets: [
    [
      '@docusaurus/preset-classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          routeBasePath: '/',
          // Please change this to your repo.
          editUrl: 'https://github.com/chain4travel/camino-docs/edit/master/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      image: 'img/Camino-Image.png?force-reload-1',
      metadata: [
        {name: 'twitter:card', content: 'summary_large_image'},
        {name: 'twitter:description', content: 'Camino is the first blockchain focussing on touristic market.'},
        {name: 'twitter:title', content:'Documentation and Tutorials for Camino'}
      ],
      navbar: {
        title: '',
        logo: {
          alt: 'Camino Logo',
          src: 'img/camino-logo.png',
        },
        items: [
          {
            type: 'localeDropdown',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Community',
            items: [
              {
                label: 'Discord',
                href: 'https://discord.com',
              },
              {
                label: 'Twitter',
                href: 'https://twitter.com/caminochain',
              },
              {
                label: 'Telegram',
                href: 'https://t.me/caminochain',
              },
              {
                label: 'Medium',
                href: 'https://medium.com/caminochain',
              }
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'GitHub',
                href: 'https://github.com/chain4travel/camino-docs',
              }
            ],
          },
          {
            
          }
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Chain4Travel AG.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
      },
      typesense: {
        typesenseCollectionName: 'camino-docs',
        typesenseServerConfig: {
          nodes: [
            {
              host: '34.141.201.213',
              port: 8108,
              protocol: 'https',
            },
          ],
          apiKey: 'pqJyOImBUj6Ey8rJSAGDbYXpF9nQfLOrdMjp5OxsxJsUolzx',
        },
        typesenseSearchParameters: {},
        contextualSearch: true,
      },
    }),
};

module.exports = config;
