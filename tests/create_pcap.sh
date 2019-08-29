#!/bin/bash
set -ex
python -m SimpleHTTPServer 8080 &
PYPID=$!
sudo tcpdump -i lo -w tests/http.trace &
TCPDPID=$!

sleep 3 # Wait for http server

# Normal requests
curl -v http://localhost:8080
curl -X PUT -d "var=somedata&var2=moredata&var3=evenmoredata" http://localhost:8080

# Non RFC compliant
echo -en 'GET /index.html HTTP/1.1\r\nHost: some_host.com\r\nHost: another_host.com\r\n\r\n' \
 | nc localhost 8080
echo -en 'GET /index.html HTTP/1.1\r\nContent-Length: 5\r\nContent-Length: 6\r\n\r\n' \
 | nc localhost 8080
echo -en 'GET /index.html HTTP/1.1\r\nTransfer-Encoding: chunked\r\nTransfer-encoding: x\r\n\r\n' \
 | nc localhost 8080
echo -en 'GET /index.html HTTP/1.1\r\nContent-Length: 5\r\nTransfer-encoding: chunked\r\n\r\n' \
 | nc localhost 8080
curl -vv -X GET -d "some_data=12345&some_more_data=99999" http://localhost:8080
sleep 5
sudo kill $TCPDPID
kill $PYPID
