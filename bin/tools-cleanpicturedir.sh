#!/bin/bash

find ./ -iregex "\(.*/Thumbs\.db\)\|\(.*/\.picasa\.ini\)" -exec rm -v {} +

