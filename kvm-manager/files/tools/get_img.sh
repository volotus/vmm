#!/bin/bash

mkdir -p /cloud/vm-images
/usr/bin/rsync -vrtop --progress  10.10.10.10::cloud /cloud/vm-images
