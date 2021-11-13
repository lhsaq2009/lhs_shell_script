#!/bin/sh
tempFile="save_jdk_output_4f4f58f1-58fb-4080-a068-afec817ab7ca"
nohup java -version > $tempFile 2>&1
installed=$(cat ./$tempFile)
system_64=$(getconf LONG_BIT)       # 查看系统多少位

if [[ $installed =~ "java version" ]]
then
  installed=$(echo $installed | grep -Eo "java version \"[0-9\.\_]*\"")   # 1.8.0_261
  echo "JDK 已安装: $installed"
else
  echo "准备安装 1.8.0_261 ..."

  if [[ system_64 =~ "64" ]]
  then
    wget http://lhsaq2009.oss-cn-hangzhou.aliyuncs.com/file/jdk-8u261-linux-x64.rpm         # linux 64 位
  else
    wget http://lhsaq2009.oss-cn-hangzhou.aliyuncs.com/file/jdk-8u261-linux-i586.rpm        # linux 32 位
  fi

  rpm -ivh jdk-8u261-linux-x64.rpm

  echo "安装成功: java version 1.8.0_261"

  rm -rf jdk-8u261-linux-x64.rpm
  rm -rf jdk-8u261-linux-i586.rpm
fi

rm -rf $tempFile