#!/bin/bash

echo "Cleaning .keep files..."
find ./ -name *.*.keep -exec rm -v {} +

echo "Cleaning .contrib files..."
find ./ -name *.*.contrib -exec rm -v {} +

echo "Cleaning .orig files..."
find ./ -name *.*.orig -exec rm -v {} +

