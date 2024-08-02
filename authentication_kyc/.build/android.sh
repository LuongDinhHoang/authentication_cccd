#!/bin/bash
set -e


# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build apk lib/main.dart --release

firebase appdistribution:distribute './build/app/outputs/flutter-apk/app-release.apk'  \
    --app 1:176485984910:android:e2b61084e3def0308f37df  \
    --release-notes-file "$note_file" \
    --groups "android"

echo '-------------------'
echo 'Build Android done'