#! /usr/bin/bash

xrandr --output DisplayPort-1 --primary --auto
echo "First Screen configured"
xrandr --output DisplayPort-2 --right-of DisplayPort-1 --rotate right --auto
echo "Second Screen configured"
echo 'awesome.restart()' | awesome-client
