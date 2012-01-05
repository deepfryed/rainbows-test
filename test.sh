#!/bin/bash

echo "##########################################################################################"
echo "testing rainbows"
echo "##########################################################################################"
echo 

./bin/rainbows -c config.rb myapp.ru &
pid=$!

sleep 1
ab -q -n2000 -c10 http://127.0.0.1:4000/
kill -QUIT $pid

sleep 1
echo "##########################################################################################"
echo "testing thin"
echo "##########################################################################################"
echo 

./bin/pastry -p 4000 -R myapp.ru start > /dev/null &
pid=$!
sleep 1

ab -q -n10000 -c10 http://127.0.0.1:4000/
kill -QUIT $pid
