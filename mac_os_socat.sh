#!/bin/sh

# Install:
# $ brew install socat

socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
