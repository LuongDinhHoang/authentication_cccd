#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

# Đọc nội dung từ tệp tin txt
release_notes=$(cat "$note_file")

fvm flutter build ipa --release --export-method ad-hoc

firebase appdistribution:distribute './build/ios/ipa/easy_kyc.ipa' \
    --app 1:179883609380:ios:aa866e46f8d9dc90e937b1 \
    --release-notes "Thời gian: $(date "+%Y-%m-%d %H:%M:%S")\n $release_notes" \
    --groups "ios"

echo '-------------------'
echo 'Build IOS done'