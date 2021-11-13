#!/bin/sh
version=$(git --version)
# echo -e $version          # git version 1.8.3.1

if [[ $version =~ "git version" ]]
then
  installed=$(echo $version | grep -Eo "git version [0-9\.]*")
  echo "git 已安装: $installed"
else
  echo "准备安装 git ..."

  yum -y install git

  version=$(git --version)
  # version='git version 1.8.3.1'
  echo "安装成功: $version，安装目录：/usr/libexec/git-core"

fi