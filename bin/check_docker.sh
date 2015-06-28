#!/bin/bash
docker run --rm -it --net host --pid host --cap-add audit_control \
  -v /var/lib:/var/lib -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/lib/systemd:/usr/lib/systemd  -v /etc:/etc \
  --label docker-bench-security diogomonica/docker-bench-security
