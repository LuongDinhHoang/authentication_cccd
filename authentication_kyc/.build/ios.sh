#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build ipa --release --export-method ad-hoc

firebase appdistribution:distribute './build/ios/ipa/easy_kyc.ipa' \
    --app 1:176485984910:ios:4169512e02a5d2398f37df \
    --release-notes-file "$note_file" \
    --groups "ios"

echo '-------------------'
echo 'Build IOS done'