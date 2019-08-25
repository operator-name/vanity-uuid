#!/usr/bin/env bash

# THIS DOES NOT FOLLOW THE UUID SPEC. IT SHOULDN'T BREAK ANYTHING BUT USE AT YOUR OWN RISK!

uuid0=$(grep -E "^.{8}$" hexwords.txt | shuf -n 1)
uuid1=$(grep -E "^.{4}$" hexwords.txt | shuf -n 1)
uuid2=$(grep -E "^.{4}$" hexwords.txt | shuf -n 1)
uuid3=$(grep -E "^.{4}$" hexwords.txt | shuf -n 1)
uuid4=$(grep -E "^.{12}$" hexwords.txt | shuf -n 1)
uuid=$uuid0-$uuid1-$uuid2-$uuid3-$uuid4

echo $uuid 
echo $uuid | sed "s/o/0/g;s/i/1/g;s/l/1/g;s/s/5/g;s/t/7/g"