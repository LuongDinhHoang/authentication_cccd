#!/bin/bash
set -e


# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

# Đọc nội dung từ tệp tin txt
release_notes=$(cat "$note_file")

fvm flutter build apk lib/main.dart --release

firebase appdistribution:distribute './build/app/outputs/flutter-apk/app-release.apk'  \
    --app 1:179883609380:android:f95483ed5e008869e937b1  \
    --release-notes "Thời gian: $(date "+%Y-%m-%d %H:%M:%S")\n $release_notes" \
    --groups "android"

echo '-------------------'
echo 'Build Android done'