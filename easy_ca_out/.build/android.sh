#!/bin/bash
set -e


# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build apk lib/main.dart --release

firebase appdistribution:distribute './build/app/outputs/flutter-apk/app-release.apk'  \
    --app 1:179883609380:android:f95483ed5e008869e937b1  \
    --release-notes-file "$note_file" \
    --groups "android"

echo '-------------------'
echo 'Build Android done'