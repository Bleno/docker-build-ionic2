# docker-build-ionic2
Build a ionic 2 app

# Usage

## Build project

	npm install

    ionic cordova platform add android

    ionic cordova build android --prod


# Sendemail

## sendemail for send email notification

    sendemail -xu  youremail@gmail.com -xp 'yourpassword' -s smtp.gmail.com:587 -o tls=yes -f desnt-email@gmail.com -t desnt-email@gmail.com -u testeemail -m "Teste sendemail"

## Latest

Versions Components:

* Java 8
* Gradle 3.2
* Node 6.11.1
* Cordova 7.0.1
* Ionic 3.5.0
* Android SDK Tool 25.2.5
* Android SDK Platform-tools 26
* Android SDK Build-tools 23.0.1
* SDK Platform API 25 rev. 3
* Android support Reposotory 47
* Google Play Services 42
* Google Repository 55