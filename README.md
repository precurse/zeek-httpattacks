# zeek-httpattacks

[![Build Status](https://travis-ci.com/precurse/zeek-httpattacks.svg?branch=master)](https://travis-ci.com/precurse/zeek-httpattacks)

# Description

This module detects HTTP requests that are non RFC compliant requests including:
- Multiple HTTP Host headers
- GET requests with a body
- Both `Content-Length` and `Transfer-Encoding` present
- Multiple of `Content-Length` and/or `Transfer-Encoding` headers

When any of these are detected, an `HTTP_Smuggling` notice will be added to `notice.log`.

# Installation
- Install via Zeek package manager:
   ```bash
   $ zkg install zeek-httpattacks

   # or for legacy installs

   $ zkg install zeek-httpattacks
   ```

- Download the files to `$PREFIX/zeek/share/zeek/site/zeek-httpattacks` and add the following to your `local.zeek`:
    ```bash
    @load ./zeek-httpattacks
    ```

# Configuration

There are currently no configuration flags that can be used with this module. If you would like a new feature, please create a pull request.

# notice.log Examples

```
HTTPATTACKS::HTTP_Smuggling	Multiple HTTP Host headers detected
HTTPATTACKS::HTTP_Smuggling	More than one CL or TE header detected
HTTPATTACKS::HTTP_Smuggling	CL and TE headers detected
HTTPATTACKS::HTTP_Smuggling	HTTP GET request with body detected
```

# Automated Testing

Travis CI is used to run automated tests on each and every commit.

# Created By
Andrew Klaus (@precurse)
