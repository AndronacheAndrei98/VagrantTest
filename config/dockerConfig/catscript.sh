#!/bin/bash
if nc -zv 192.168.56.11 6379; then
    echo "Redis VM is up "
fi

if nc -zv 192.168.56.12 5432; then
    echo "postgres VM is up "
fi