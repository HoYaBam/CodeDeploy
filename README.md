# CodeDeploy
 - [참고 사이트](https://blog.bespinglobal.com/post/github-action-%EC%9C%BC%EB%A1%9C-ec2-%EC%97%90-%EB%B0%B0%ED%8F%AC%ED%95%98%EA%B8%B0/)

# AWS 해야할 작업
### 1. S3 버킷을 생성해야 한다.
### 2. IAM CodeDeploy 액세스 키를 생성할 계정을 생성해야 한다. AWSCodeDeployFullAccess 와 S3 접속 권한이 필요하다. 
### 3. IAM 역할을 생성해야한다. EC2 권한을 부여하는 역할로 AWSCodeDeployFullAccess 와 S3 접속 권한이 필요하다.
### 4. IAM 역할을 생성해야한다. 그룹 권한에서 사용할 역할로 AWSCodeDeployRole 권한이 필요하다.
### 5. CodeDeploy 생성해야 한다. 배포 그룹생성 하면서 EC2 지정을 잘해한다. CodeDeployDefault.AllAtOnce를 보통 사용한다. ROLE은 3번을 사용하면된다.
### 6. EC2서버에 CodeDeploy agent 설치해야 한다.
~~~
sudo apt update
sudo apt install ruby-full
sudo apt install wget
cd ~ 
wget https://aws-codedeploy-ap-northeast-2.s3.ap-northeast-2.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent status
~~~
