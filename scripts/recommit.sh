#!/bin/bash

last_commit_message=$(git log -1 --pretty=%B)

git reset --soft HEAD~1

git add --all

git commit -m "$last_commit_message"

echo "Added and Recommitted with the message: $last_commit_message"
