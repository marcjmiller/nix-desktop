#!/usr/bin/env bash

ping -qc 3 8.8.8.8 2>&1 | awk -F'/' 'END{print(/^rtt/?"Ping: " int($5)"ms":"disconnected")}'
