import React, { useEffect, useRef } from 'react';

const AsciinemaEmbed = ({ id }) => {
  const containerRef = useRef(null);

  useEffect(() => {
    if (!containerRef.current) return;

    // Create script element
    const script = document.createElement('script');
    script.async = true;
    script.id = `asciicast-${id}`;
    script.src = `https://asciinema.org/a/${id}.js`;
    script.setAttribute('data-asciicast-id', id);

    // Append script to the container
    containerRef.current.appendChild(script);

    return () => {
      // Cleanup script from the container
      if (containerRef.current) {
        containerRef.current.removeChild(script);
      }
    };
  }, [id]);

  return <div ref={containerRef} />;
};

export default AsciinemaEmbed;
