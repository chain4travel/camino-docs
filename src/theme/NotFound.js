import React, { useEffect } from 'react';
import { useLocation, useHistory } from 'react-router-dom';
import NotFound from '@theme-original/NotFound';

function removeTrailingSlash(str) {
  return str.endsWith('/') ? str.slice(0, -1) : str;
}

const replacers = {
  "/to/wallet-validate-cams": "/guides/add-validator-with-curl#camino-mainnet--columbus-testnet",
  "/to/wallet-validate-kyc-kyb": "/guides/kyc",
  "/to/wallet-validate-voted": "/guides/add-validator-with-curl#camino-mainnet--columbus-testnet",
  "/to/wallet-validate-c-member": "/guides/add-validator-with-curl#camino-mainnet--columbus-testnet",
  "/to/wallet-validate-reg-node": "/guides/add-validator-with-curl#register-your-node",
  "/to/wallet-validate-suspension": "/guides/reasons-for-validator-suspension",
  "/to/wallet-validate-pending": "/guides/reasons-for-validator-pending",
  "/to/create-a-local-test-network": "/developer/guides/create-a-local-test-network",
  "/developer/build/create-a-local-test-network": "/developer/guides/create-a-local-test-network",
  "/build/tutorials/columbus-testnet": "/about/columbus-testnet/",
  "/apps/nodes/add-validator-with-curl": "/guides/add-validator-with-curl",
  "/apps/nodes/add-validator": "/guides/add-validator-with-wallet",
  "/apps/nodes/run-camino-node": "/nodes/set-up-node-manual-installation",
  "/apps/nodes/set-up-node-with-installer": "/nodes/set-up-node-with-installer",
  "/apps/nodes/set-up-node-with-docker": "/nodes/set-up-node-with-docker",
  "/apps/nodes/camino-node-config-flags": "/apps/nodes/camino-node-config-flags",
  "/apps/release-notes/camino-node": "/release-notes/camino-node",
  "/apps/release-notes/caminogo": "/release-notes/caminogo",
  "/apps/release-notes/caminoethvm": "/release-notes/caminoethvm",
  "/apps/release-notes/magellan": "/release-notes/magellan",
  "/guides/add-validator": "/guides/add-validator-with-wallet",
  "/about/camino-platform-overview": "/about/camino-network-overview",
}

export default function NotFoundWrapper(props) {
  const location = useLocation()
  const history = useHistory()

  useEffect(() => {
    const redirect = replacers[removeTrailingSlash(location.pathname)]
    if (redirect) history.replace(redirect)
  }, [location]);
  
  return (
    <>
      <NotFound {...props} />
    </>
  );
}
