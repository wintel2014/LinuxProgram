#!/bin/bash
apt-cache search linux-source | tail -n 1
sudo apt-get install linux-source-3.13.0
