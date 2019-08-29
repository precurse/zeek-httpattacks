# zeek-httpattacks

[![Build Status](https://travis-ci.org/precurse/zeek-httpattacks.svg?branch=master)](https://travis-ci.org/precurse/zeek-httpattacks)

# Description

This module detects HTTP requests that are non RFC compliant requests including:
- Multiple HTTP Host headers
- GET requests with a body
- Both `Content-Length` and `Transfer-Encoding` present
- Multiple of `Content-Length` and/or `Transfer-Encoding` headers

When any of these are detected, an `HTTP_Smuggling` notice will be added to `notice.log`.

# Configuration

There are currently no configuration flags that can be used with this module. If you would like a new feature, please create a pull request.

# Automated Testing

Travis CI is used to run automated tests on each and every commit.

# Created By
Andrew Klaus (@precurse)
