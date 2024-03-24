#!/bin/bash

find / -name 'php-fpm*' 2>/dev/null

exec "$@"
