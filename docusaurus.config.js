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
  url: 'https://docs.camino.network',
  baseUrl: '/',
  //onBrokenLinks: 'throw',
  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.png',
  organizationName: 'chain4travel', // Usually your GitHub org/user name.
  projectName: 'camino-docs', // Usually your repo name.
  themes: ['docusaurus-theme-search-typesense'],

  plugins: [
    require.resolve('docusaurus-plugin-image-zoom')
  ],

  presets: [
    [
      '@docusaurus/preset-classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          routeBasePath: '/',
          // Please change this to your repo.
          editUrl: 'https://github.com/chain4travel/camino-docs/edit/dev/',
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
      zoom: {
        selector: '.markdown :not(em) > img, img.zoom',
        background: {
          light: 'rgb(255, 255, 255)',
          dark: 'rgb(50, 50, 50)'
        },
        config: {
          // options you can specify via https://github.com/francoischalifour/medium-zoom#usage
        }
      },
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
                href: 'https://discord.gg/camino',
              },
              {
                label: 'Twitter',
                href: 'https://twitter.com/camino_network',
              },
              {
                label: 'Telegram',
                href: 'https://t.me/camino_network',
              },
              {
                label: 'LinkedIn',
                href: 'https://www.linkedin.com/company/caminonetwork/',
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
        typesenseCollectionName: 'camino-docs-default',
        typesenseServerConfig: {
          nodes: [
            {
              host: 'typesense.camino.network',
              port: 443,
              protocol: 'https',
            },
          ],
          apiKey: 'TfCsn1wHrrpAzkHQP7747iPAS83Rsqn3',
        },
        typesenseSearchParameters: {
          replaceSynonymsInHighlight:false,
          group_limit:5,
          group_by: 'hierarchy.lvl0',
        },
        contextualSearch: true,
      },
    }),
};

module.exports = config;
