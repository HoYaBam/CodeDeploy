#!/bin/bash
WORK_PATH=/webstore/pub/codeDeploy/work # 자신이 사용할 폴더
BUILD_PATH=$(ls $WORK_PATH/build/*.jar) # ls를 실행하면서 반환값을 저장한다.
JAR_NAME=$(basename $BUILD_PATH) # basename 파일이름 추출작업
echo "> build 파일명: $JAR_NAME"

echo "> build 파일 복사"
DEPLOY_PATH=~/coDeploy/work/
cp $BUILD_PATH $DEPLOY_PATH

echo "> jar파일 교체"
CP_JAR_PATH=$DEPLOY_PATH$JAR_NAME
APPLICATION_JAR_NAME=codeDeploy.jar
APPLICATION_JAR=$DEPLOY_PATH$APPLICATION_JAR_NAME

ln -Tfs $CP_JAR_PATH $APPLICATION_JAR # 링크파일을 생성한다.

echo "> 현재 실행중인 애플리케이션 pid 확인"
CURRENT_PID=$(pgrep -f $APPLICATION_JAR_NAME)

if [ -z $CURRENT_PID ]
then
  echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다."
else
  echo "> kill -15 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> $APPLICATION_JAR 배포"
echo "> spring.profiles.active=$DEPLOYMENT_GROUP_NAME"
nohup java -jar -Xms256m -Xmx1024m $APPLICATION_JAR > /dev/null 2> /dev/null < /dev/null &
