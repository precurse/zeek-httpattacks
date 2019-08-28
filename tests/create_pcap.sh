#!/bin/bash
echo -en 'GET /index.html HTTP/1.1\r\nHost: some_host.com\r\nHost: another_host.com\r\n\r\n' \
 | nc localhost 8080
echo -en 'GET /index.html HTTP/1.1\r\nContent-Length: 5\r\nContent-Length: 6\r\n\r\n' \
 | nc localhost 8080
echo -en 'GET /index.html HTTP/1.1\r\nTransfer-Encoding: chunked\r\nTransfer-encoding: x\r\n\r\n' \
 | nc localhost 8080
curl -vv -X GET -d "some_data=12345&some_more_data=99999" http://localhost:8080
