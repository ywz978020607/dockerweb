FROM ubuntu:latest

#基础依赖
RUN apt-get update && apt-get -y install zip unzip && apt-get -y install vim

# 应用环境变量
ENV APP_NAME=docker-maven-test
ENV APP_HOME=/home/admin/docker-maven-test
ENV JAR_FILE=docker-maven-test-1.0.0

# 将构建出的主包复制到指定镜像目录中
RUN  groupadd admin && \
useradd admin -g admin && \
mkdir -p /home/admin/$APP_NAME/logs /home/admin/$APP_NAME/bin /home/admin/$APP_NAME/target /home/admin/$APP_NAME/target/lib

#jdk1.8环境
RUN mkdir /usr/local/java
ADD /src/soft/jdk-8u202-linux-x64.tar.gz /usr/local/java/
RUN ln -s /usr/local/java/jdk1.8.0_202 /usr/local/java/jdk
ENV JAVA_HOME /usr/local/java/jdk
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH

#准备自动构建打包环境
COPY /src/soft/apache-maven-3.3.9-bin.tar.gz /home/admin/$APP_NAME/bin/
RUN tar xzvf /home/admin/$APP_NAME/bin/apache-maven-3.3.9-bin.tar.gz
RUN rm -f /home/admin/$APP_NAME/bin/apache-maven-3.3.9-bin.tar.gz
COPY /src/soft/settings.xml /root/.m2/
RUN cp -R apache-maven-3.3.9 /usr/local/bin
RUN export PATH=apache-maven-3.3.9/bin:$PATH
RUN export PATH=/usr/local/bin/apache-maven-3.3.9/bin:$PATH
RUN ln -s /usr/local/bin/apache-maven-3.3.9/bin/mvn /usr/local/bin/mvn

#应用工作空间
WORKDIR /build/
COPY pom.xml /build/

#如果应用代码在公网，可以使用git clone 将项目克隆下来，再次copy
COPY docker-maven-test /build/docker-maven-test/
RUN mvn -q clean package -Dmaven.test.skip=true

#拷贝应用包
RUN cp /build/docker-maven-test/target/$JAR_FILE.jar /home/admin/$APP_NAME/target/$APP_NAME.jar

#设置系统编码
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
ENV TZ=Asia/Shanghai
ENV LC_ALL zh_CN.UTF-8

# 复制脚本文件
COPY docker-maven-test/start.sh /home/admin/$APP_NAME/bin/

# 切换工作空间
WORKDIR /home/admin/$APP_NAME/
RUN chmod -R a+x /home/admin/$APP_NAME/bin/*.sh && \
chown -R admin:admin /home/admin/*

# 运行jar包
# ENTRYPOINT ["java","-jar","docker-maven-test-1.0.0.jar"]