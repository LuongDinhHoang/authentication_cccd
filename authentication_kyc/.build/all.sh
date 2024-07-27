#!/bin/bash
set -e
sh .build/ios.sh
sh .build/android.sh
echo '-------------------'
echo 'Build All done'
echo '-------------------'
