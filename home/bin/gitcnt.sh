#!/bin/bash

CURRENT_USER=$(git config user.name)
CURRENT_EMAIL=$(git config user.email)

git log --since="2025-01-01" --author="${CURRENT_USER}" --pretty=format:"%h %s" --numstat | 
awk '
BEGIN { 
    commit_count = 0
    added = 0
    removed = 0
}
/^[0-9a-f]{7,} / { commit_count++ }
/^[0-9]+\t/ { 
    added += $1
    removed += $2
}
END {
    print "提交次数: " commit_count
    print "添加行数: " added
    print "删除行数: " removed
    print "净变更: " (added - removed)
}'
