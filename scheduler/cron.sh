#!/bin/bash -e
while [ true ]
do
    php artisan schedule:run --verbose
    sleep 60
done
