# docker-build-ionic2
Build a ionic 2 app

# Usage

## Build project

    cd name-project

	npm install

    ionic cordova platform add android

    ionic cordova build android --prod


# Sendemail

## sendemail for send email notification

    sendemail -xu  youremail@gmail.com -xp 'yourpassword' -s smtp.gmail.com:587 -o tls=yes -f desnt-email@gmail.com -t desnt-email@gmail.com -u testeemail -m "Teste sendemail"

## Latest

Versions Components:

* Java 8
* Gradle 4.6
* Node 8
* Cordova 8.0.0
* Ionic 3.20.0
* Android SDK Tool 26.0.1
* Android SDK Platform-tools 27.0.1
* Android SDK Build-tools 27.0.3
* SDK Platform API 26 rev. 2
* Android support Reposotory 47
* Google Play Services 48
* Google Repository 58


## SDK Manager


    /opt/android-sdk/tools/bin/sdkmanager --sdk_root=/opt/android-sdk/ "build-tools;27.0.3" "sources;android-27" "extras;android;m2repository" "extras;google;m2repository" "extras;google;google_play_services"