#!/bin/bash

echo "Cleaning *.keep files..."
find ./ -name *.keep -exec rm {} +

