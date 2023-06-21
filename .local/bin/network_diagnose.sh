#!/bin/bash

echo "Trying to ping localhost."
ping -c 4 localhost &> /dev/null
[ $? -ne 0 ] && echo "Failed." && exit 1
echo "Success."

echo "Trying to ping public IP address."
ping -c 4 8.8.8.8 &> /dev/null
[ $? -ne 0 ] && echo "Failed." && exit 1
echo "Success."

echo "Trying to resolve domain names."
ping -c 4 gnu.org &> /dev/null
[ $? -ne 0 ] && echo "Failed." && exit 1
echo "Success."

echo "Network configuration is correct."
