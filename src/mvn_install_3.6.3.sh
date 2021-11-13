#!/bin/sh
mvn_version=$(mvn -v)
# echo -e $mvn_version

if [[ $mvn_version =~ "Maven home" ]]
then
  mvn_installed=$(echo $mvn_version | grep -Eo "Apache Maven [0-9\.]*")
  echo "maven 已安装: $mvn_installed"
else
  echo "准备安装 Apache Maven 3.6.3 ..."
  # wget https://mirror.bit.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
  wget http://lhsaq2009.oss-cn-hangzhou.aliyuncs.com/file/apache-maven-3.6.3-bin.tar.gz
  tar -zvxf apache-maven-3.6.3-bin.tar.gz
  sudo mkdir -p /usr/local/bin/maven3 && sudo cp -R ./apache-maven-3.6.3/* /usr/local/bin/maven3

  echo 'export M2_HOME=/usr/local/bin/maven3' >> ~/.bash_profile
  echo 'PATH=$PATH:$M2_HOME/bin' >> ~/.bash_profile

  source ~/.bash_profile

  echo "安装成功: Apache Maven 3.6.3"
  echo "提示：mvn 配置文件：vim ~/.m2/settings.xml"
fi