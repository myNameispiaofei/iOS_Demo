#!/bin/bash

info_plist_name="Info"

cd ./
project_name=`find . -name *.xcodeproj | awk -F "[/.]" '{print $(NF-1)}'`
info_plist_path="$project_name/$info_plist_name.plist"