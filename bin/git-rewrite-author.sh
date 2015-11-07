#!/bin/sh

# Usage:
##  git clone --bare https://github.com/user/repo.git
##  git-rewrite-author.sh <oldEmail> "<Name>" <newEmail>
##  git push --force --tags origin 'refs/heads/*'

[ ! $# -eq 3 ] && echo "Usage $(basename $0) <oldEmail> \"<Name>\" <email>" && exit 1

RENAME_AUTHOR=$(cat <<EOF
OLD_EMAIL="$1"
CORRECT_NAME="$2"
CORRECT_EMAIL="$3"
if [ "\$GIT_COMMITTER_EMAIL" = "\$OLD_EMAIL" ]
then
  export GIT_COMMITTER_NAME="\$CORRECT_NAME"
  export GIT_COMMITTER_EMAIL="\$CORRECT_EMAIL"
fi
if [ "\$GIT_AUTHOR_EMAIL" = "\$OLD_EMAIL" ]
then
  export GIT_AUTHOR_NAME="\$CORRECT_NAME"
  export GIT_AUTHOR_EMAIL="\$CORRECT_EMAIL"
fi
EOF
)

git filter-branch -f --env-filter "$RENAME_AUTHOR" --tag-name-filter cat -- --branches --tags
