FROM ubuntu:14.04

MAINTAINER Bleno <blenobok@gmail.com>



RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y wget curl tar  build-essential


RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm \
    && npm install -g cordova \
    && npm install -g ionic \
    && npm install -g bower


RUN apt-get install -y python git wget make openjdk-7-jdk zip

RUN cd /tmp/ && wget http://dl.google.com/android/adt/22.6.2/adt-bundle-linux-x86_64-20140321.zip \
    && unzip adt-bundle-linux-x86_64-20140321.zip && cd adt-bundle-linux-x86_64-20140321 \
    && mv sdk/ /android-dev/ && cd /android-dev/ &&  mv sdk/ android-sdk/

RUN echo yes | /android-dev/android-sdk/tools/android update sdk -u -a -t 1,3,4,27


# develop environment
ENV ANDROID_HOME=/android-dev/android-sdk \
    JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre \
# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
    ANDROID_SDK_ROOT=/android-dev/android-sdk \
    PATH=$ANDROID_SDK_ROOT:$PATH \
    PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

RUN apt-get -y autoclean && apt-get -y autoremove


#entrypoint
WORKDIR /project
