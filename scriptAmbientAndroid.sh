
#!/bin/bash
NODEJS_VERSION="10"
IONIC_VERSION="3.9.2"
ANDROID_SDK_VERSION="3859397"
##variables de entorno
##modify this file /etc/environment, then add these var
##then you shoul be export it like this export ANDROID_HOME="/opt/android-sdk" from terminal
JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
##variables de entorno
ANDROID_BUILD_TOOLS_VERSION="28.0.1"
ANDROID_HOME "${ANDROID_HOME}"

sudo apt-get update
echo "****************************** step 1*******************************" 
sudo apt-get install -y build-essential 
echo "****************************** step 2*******************************" 
sudo apt-get install -y openjdk-8-jre
echo "****************************** step 3*******************************" 
sudo apt-get install -y openjdk-8-jdk
echo "****************************** step 4*******************************" 
sudo apt-get install -y curl
echo "****************************** step 5*******************************" 
sudo apt-get install -y  unzip
echo "****************************** step 6*******************************" 
sudo apt-get install -y  git
echo "****************************** step 7*******************************" 
sudo apt-get install -y  gradle        
echo "****************************** step 8*******************************" 
sudo curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION}.x | bash - 
echo "****************************** step 9*******************************" 
sudo apt-get update 
echo "****************************** step 10*******************************" 
sudo apt-get install -y nodejs 
echo "****************************** step 11*******************************" 
sudo npm install -g cordova ionic@${IONIC_VERSION} 
echo "****************************** step 12*******************************" 
sudo npm install --unsafe-perm -g cordova-res  
echo "****************************** step 13*******************************" 
cd /tmp 
echo "****************************** step 14*******************************" 



FILE=/tmp/tools
if [ -d "$FILE" ]; then
    echo "Folder tools exist"
else 
    sudo curl -fSLk https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_VERSION}.zip -o sdk-tools-linux-${ANDROID_SDK_VERSION}.zip 
    echo "****************************** step 15*******************************" 

    sudo unzip sdk-tools-linux-${ANDROID_SDK_VERSION}.zip 
    echo "****************************** step 16*******************************" 
fi

sudo mkdir /opt/android-sdk 
echo "****************************** step 17*******************************" 
sudo mv tools /opt/android-sdk 
echo "****************************** step 18*******************************" 
sudo $ANDROID_HOME/tools/bin/sdkmanager "platform-tools" 
echo "****************************** step 19*******************************" 
sudo $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" 
echo "****************************** step 19*******************************" 

sudo sudoapt-get autoremove -y
