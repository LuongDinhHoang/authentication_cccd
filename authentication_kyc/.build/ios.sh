#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build ipa --release --export-method ad-hoc

firebase appdistribution:distribute './build/ios/ipa/easy_kyc.ipa' \
    --app 1:179883609380:ios:aa866e46f8d9dc90e937b1 \
    --release-notes-file "$note_file" \
    --groups "ios"

echo '-------------------'
echo 'Build IOS done'