#!/bin/bash

# Flutter 설치
git clone https://github.com/flutter/flutter.git -b stable ~/flutter
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
source ~/.bashrc

# 의존성 설치
sudo apt update && sudo apt install -y unzip curl git openjdk-11-jdk

# Android SDK 설치
mkdir -p $HOME/Android/Sdk
curl -o sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip sdk-tools.zip -d $HOME/Android/Sdk/cmdline-tools
mv $HOME/Android/Sdk/cmdline-tools $HOME/Android/Sdk/cmdline-tools/latest

echo 'export ANDROID_HOME="$HOME/Android/Sdk"' >> ~/.bashrc
echo 'export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"' >> ~/.bashrc
echo 'export PATH="$PATH:$ANDROID_HOME/platform-tools"' >> ~/.bashrc
source ~/.bashrc

# Flutter doctor 실행
flutter doctor
