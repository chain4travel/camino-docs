<div align="center">
  <img src="static/img/camino-logo.png?raw=true">
</div>

---
# Camino Docs

## Overview
This repo contains the contents for our docs deployed [here](https://docs.camino.foundation).

The website is built using [Docusaurus 2](https://docusaurus.io/).

## Contributing

Contributing to the docs site is a great way to get involved with the Camino dev community! Here are some things you need to know to get started.

### Contents
* All the docs are located in the [docs](docs) directory.
* The left sidebar of the page is controlled by [sidebars.js](sidebars.js).
* Extensive docs for Docusaurus can be found [here](https://docusaurus.io/docs).

### Pull Request (PR)
* All PRs should be made against the `dev` branch.
* Once your PR is merged into `dev`, [docs (testing)](https://playground.docs.camino.foundation/) will be updated with your changes.
* After review from our staff, we merge `dev` regularly into `c4t`. Then it's updated on the [production site](https://docs.camino.foundation/).

### Installation

```
$ yarn
```

### Local Development

```
$ yarn start
```

This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.

### Build

```
$ yarn build
```

This command generates static content into the `build` directory and can be served using any static contents hosting service. 

**Please make sure that you run this command to see if there is any error in building the package, and fix them before pushing your changes.**

## Search
Search is powered by Typesense and we use our own server environment for holding the indices.