FROM ubuntu:14.04

MAINTAINER Bleno <blenobok@gmail.com>

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y wget curl tar  build-essential software-properties-common \
    && add-apt-repository ppa:webupd8team/java -y

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm \
    && npm install -g cordova \
    && npm install -g ionic \
    && npm install -g bower


# https://developer.android.com/studio/install.html?pkg=tools
# lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6
# python for general scripts
# sendemail for send email notification
# java8 oracle
RUN  apt-get update \
     && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
     && apt-get install -y python git make zip oracle-java8-installer \
     libnet-ssleay-perl libio-socket-ssl-perl sendemail \
     lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6


# https://developer.android.com/studio/index.html
# RUN wget http://dl.google.com/android/android-sdk_r24.3.1-linux.tgz \
#     && tar -zxvf android-sdk_r24.3.1-linux.tgz

# TODO ATUALIZAR https://dl.google.com/android/repository/tools_r25.2.5-linux.zip

RUN mkdir -p /opt/android-sdk \
    && cd /opt/android-sdk \
    && wget   https://dl.google.com/android/repository/tools_r25.2.5-linux.zip \
    && unzip tools_r25.2.5-linux.zip


RUN echo yes | /opt/android-sdk/tools/android update sdk -u -a -t 1,2,3,33,162,168,169 #,3,42,115,166,172,173,34,35,36 

# RUN mv /opt/android-sdk/tools /opt/android-sdk/temp/ToolPackage.old01. \
#     && mkdir -p /opt/android-sdk/tools \ 
#     && unzip -d /opt/android-sdk /opt/android-sdk/temp/tools_r25.2.4-linux.zip

ENV ANDROID_SDK_ROOT=/opt/android-sdk 

# # develop environment
ENV ANDROID_HOME=/opt/android-sdk \
    JAVA_HOME=/usr/lib/jvm/java-8-oracle/ \
# Add environment variable ANDROID_SDK_ROOT
    PATH=$ANDROID_SDK_ROOT:$PATH \
    PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# RUN mkdir "$ANDROID_SDK/licenses" || true \
#     &&  echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_SDK/licenses/opt/android-sdk-license" \
#     && echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_SDK/licenses/opt/android-sdk-preview-license"


RUN rm /opt/android-sdk/tools_r25.2.5-linux.zip \
    && apt-get -y autoclean && apt-get -y autoremove \
    && rm -rf /tmp/* \
    && rm -rf /opt/android-sdk/temp/*

RUN mkdir /project

#entrypoint
WORKDIR /project

# android list sdk --all
# 1,2,3,33,162,168,169

# ANDROID Tools 25.2.5 install

# 1- Android SDK Tools, revision 25.2.5
# 2- Android SDK Platform-tools, revision 25.0.3
# 3- Android SDK Build-tools, revision 25.0.2
# 33- SDK Platform Android 7.1.1, API 25, revision 3
# 162- Android Support Repository, revision 44
# 168- Google Play services, revision 39
# 169- Google Repository, revision 44

# 1- Android SDK Tools, revision 25.2.4
# 2- Android SDK Platform-tools, revision 25.0.3
# 3- Android SDK Build-tools, revision 25.0.2
# 16- Android SDK Build-tools, revision 21.1.2
# 35- SDK Platform Android 6.0, API 23, revision 3
# 36- SDK Platform Android 5.1.1, API 22, revision 2
# 42- SDK Platform Android 4.1.2, API 16, revision 5
# 84- ARM EABI v7a System Image, Android API 22, revision 2
# 115- ARM EABI v7a System Image, Android API 16, revision 4
# 166- Android Support Repository, revision 41
# 172- Google Play services, revision 38
# 173- Google Repository, revision 41
#
# 34- SDK Platform Android 7.0, API 24, revision 2
# 35- SDK Platform Android 6.0, API 23, revision 3
# 36- SDK Platform Android 5.1.1, API 22, revision 2
# update sdk -u -a -t 1,2,16,42,115,166,172,173



# TODO
#  INCLUIR!!!!
# 1. "SDK Platform" for android-23
# 2. "Android SDK Platform-tools (latest)
# 3. "Android SDK Build-tools" (latest)
