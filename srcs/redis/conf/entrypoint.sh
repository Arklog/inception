#!/bin/bash

chown /var/lib/redis redis:redis

exec "$@"
