#!/bin/sh
 
# http://i.dotidea.cn/2015/04/git-amend-author/
# 这个只是一个后悔药的作用, 并不能实时修改
git filter-branch --env-filter '
 
an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"
 
if [ "$GIT_COMMITTER_EMAIL" = "pbdm915@gmail.com" ]
then
    cn="pengbo"
    cm="pengbo@qiyi.com"
fi
if [ "$GIT_AUTHOR_EMAIL" = "pbdm915@gmail.com" ]
then
    an="pengbo"
    am="pengbo@qiyi.com"
fi
 
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"
'
