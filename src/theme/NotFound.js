import React, { useEffect } from 'react';
import { useLocation, useHistory } from 'react-router-dom';
import NotFound from '@theme-original/NotFound';

function removeTrailingSlash(str) {
  return str.endsWith('/') ? str.slice(0, -1) : str;
}

const replacers = {
  "/build/tutorials/columbus-testnet": "/about/columbus-testnet/",
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
