#!/bin/bash
echo "Setting up the broken environment, please wait..."
while [ ! -f /tmp/finished ]; do sleep 1; done
clear
echo "DONE - click START"
