#!/bin/bash
if nc -zv 192.168.56.11 6379; then
    echo "Redis VM is up "
fi

if nc -zv 192.168.56.12 3306; then
    echo "MariaDB VM is up "
fi