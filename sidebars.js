/**
 * Creating a sidebar enables you to:
 - create an ordered group of docs
 - render a sidebar for each doc of that group
 - provide next/previous navigation

 The sidebars can be generated from the filesystem, or explicitly defined here.

 Create as many sidebars as you want.
 */

// @ts-check

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  // By default, Docusaurus generates a sidebar from the docs folder structure
  // tutorialSidebar: [{type: 'autogenerated', dirName: '.'}],

  // But you can create a sidebar manually

  tutorialSidebar: [
    "intro",
    {
      type: "category",
      label: "Camino Network",
      collapsible: true,
      collapsed: false,
      link: {
        type: 'generated-index',
        slug: '/about',
      },
      items: [
        {
          type: "autogenerated",
          dirName: "about",
        },
        {
          type: 'link',
          label: 'Camino Lightpaper',
          href: 'https://camino.network/static/docs/Chain4Travel_Litepaper_June.pdf'
        },
      ],
    },
    {
      type: "category",
      label: "User Guides",
      collapsible: true,
      collapsed: false,
      link: {
        type: 'generated-index',
        slug: '/guides',
      },
      items: [
        {
          type: "autogenerated",
          dirName: "guides",
        },
      ],
    },
    {
      type: "category",
      label: "Validator Guides",
      collapsible: true,
      collapsed: true,
      link: {
        type: 'generated-index',
        slug: '/validator-guides',
      },
      items: [
        {
          type: "autogenerated",
          dirName: "validator-guides",
        },
      ],
    },
    {
      type: "category",
      label: "Camino Node",
      collapsible: true,
      collapsed: true,
      link: {
        type: 'generated-index',
        slug: '/camino-node',
      },
      items: [
        {
          type: "autogenerated",
          dirName: "camino-node",
        },
      ],
    },
    {
      type: "category",
      label: "Developer",
      collapsible: true,
      collapsed: false,
      link: {
        type: 'generated-index',
        slug: '/developer',
      },
      items: [
        {
          type: "category",
          label: "APIs",
          link: {
            type: "generated-index",
            slug: "/developer/apis",
          },
          items: [
            {
              type: "autogenerated",
              dirName: "developer/apis",
            },
          ],
        },
        {
          type: "category",
          label: "Subnets",
          collapsible: true,
          collapsed: true,
          link: {
            type: 'generated-index',
            slug: '/developer/subnets',
          },
          items: [
            {
              type: "autogenerated",
              dirName: "developer/subnets",
            },
          ],
        },
        {
          type: "category",
          label: "Guides",
          link: {
            type: "generated-index",
            slug: "/developer/guides",
          },
          items: [
            {
              type: "autogenerated",
              dirName: "developer/guides",
            },
          ],
        },
        {
          type: "category",
          label: "References",
          link: {
            type: "generated-index",
            slug: "/developer/references",
          },
          items: [
            {
              type: "autogenerated",
              dirName: "developer/references",
            },
          ],
        },
      ],
    },
    {
      type: "category",
      label: "FAQs",
      collapsible: true,
      collapsed: false,
      link: {
        type: 'generated-index',
        slug: '/faq',
      },
      items: [
        {
          type: "autogenerated",
          dirName: "faq",
        },
      ],
    },    
    {
      type: "category",
      label: "Release Notes",
      collapsible: true,
      collapsed: true,
      link: {
        type: 'generated-index',
        slug: '/release-notes',
      },
      items: [
        {
          type: "autogenerated",
          dirName: "release-notes",
        },
      ],
    },    
  ],
};

module.exports = sidebars;
