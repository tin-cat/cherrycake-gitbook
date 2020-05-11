---
description: >-
  Cherrycake structure has been modeled from the ground up with security in
  mind. Let's explore its most important security features.
---

# Security

### Request security

All requests are predefined with a specification of parameters, their expected types and validation methods. This makes for a strong first security layer that blocks anything that doesn't looks like a request our App would expect.

### Injection prevention

[SQL injection](https://en.wikipedia.org/wiki/SQL_injection) and [XSS](https://en.wikipedia.org/wiki/Cross-site_scripting) attack vectors are monitored from the very moment a user-provided data enters the App, to the moment it is stored on the database.

### CSRF detection

Cherrycake implements a [CSRF](https://en.wikipedia.org/wiki/Cross-site_request_forgery) threat detection mechanism automatically integrated into all sensible requests.

### Threat logging and blocking

Cherrycake can log all attacks and keep track of suspicious IPs, automatically blacklisting clients that have passed a configured threshold.

### Secure user authentication and session tracking

Cherrycake provides a secure user authentication and session tracking mechanisms using modern password encryption and server-based session data storage.

### Scalability

Thanks to a thorough [lifecycle](lifecycle/) and its modular structure, Cherrycake allows for the easy implementation of new security mechanisms and the improvement of the existing attack detection routines. We encourage you to contribute your suggestions, ideas and security improvements through the official [GitHub](https://github.com/tin-cat/cherrycake-engine) repository.

