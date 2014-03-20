#!/bin/bash

echo "Cleaning .keep files..."
find ./ -name *.*.keep -exec rm {} +

echo "Cleaning .contrib files..."
find ./ -name *.*.contrib -exec rm {} +

