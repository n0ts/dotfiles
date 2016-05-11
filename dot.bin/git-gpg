#!/bin/sh

email=$1
if [ -z "$email" ]; then
    email=$(git config user.email)
fi

gpg=gpg
if [ $(which gpg2) ]; then
    gpg=gpg2
fi

gpg_pub_key=$($gpg --list-keys | grep -1 "<$email>"| grep -e "^pub")
gpg_pub_key_id=$(echo $gpg_pub_key | cut -d ' ' -f 2 | cut -d '/' -f 2)
if [ -z "$gpg_pub_key_id" ]; then
    echo "Could not get gpg pub key - $gpg_pub_key_id"
    exit 1
fi

git config --local gpg.program $gpg
git config --local user.signingkey $ggp_pub_key_id
git config --local commit.gpgsign true
