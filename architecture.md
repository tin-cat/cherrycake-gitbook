# Architecture

At its simplest, Cherrycake can be understood primarily as an HTTP request router. That is, the mechanism that receives HTTP requests, hands them over to the proper module for processing, and then hands over whatever resulted from the processing to whoever did the request in the first place.

![](.gitbook/assets/cherrycakediagramroutersimple.svg)

Cherrycake runs as a PHP application behind an HTTP server like NGINX, receiving all relevant requests and connecting with any third party sources like MySQL or Redis whenever a module needs it.

Without some of the oversimplification of the diagram above, a more accurate representation of the overall architecture of a simple application running Cherrycake looks like this:

![](.gitbook/assets/cherrycakediagramserversimple.svg)

