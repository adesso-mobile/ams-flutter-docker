#!/usr/bin/env bash
set -ex
apt-get update
apt-get upgrade -y
apt-get -y install --no-install-recommends curl git lib32stdc++6 openjdk-8-jdk-headless unzip
apt-get --purge autoremove
apt-get autoclean

rm -rf /var/lib/apt/lists/* &

git clone -b stable https://github.com/flutter/flutter.git /opt/flutter

mkdir /opt/android-sdk
curl -O https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip sdk-tools-linux-4333796.zip -d /opt/android-sdk
rm sdk-tools-linux-4333796.zip

mkdir ~/.android
echo 'count=0' > ~/.android/repositories.cfg
yes | sdkmanager --licenses
sdkmanager "tools" "build-tools;29.0.0" "platforms;android-29" "platform-tools"
yes | sdkmanager --licenses
flutter doctor -v
flutter upgrade
chown -R root:root /opt
rm "$0"
