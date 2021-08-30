#!/bin/bash -x
if [ $(whoami) != "root" ]; then
        echo "This script must be run as root"
        exit 1
fi

cd `dirname $0`
TARGET_FILE="linux64-lgpl.tar.xz"
URL=`curl -s https://github.com/BtbN/FFmpeg-Builds/releases | grep href | grep "releases\/download\/" | grep ffmpeg-N- | grep ${TARGET_FILE} | head -n 1 | cut -d '"' -f 2 | sed -e "s/^/https\:\/\/github\.com/g"`
TARGET_URL=`curl -I -Ls -o /dev/null -w %{url_effective} ${URL}`
curl ${TARGET_URL} -o ${TARGET_FILE} || exit 1
tar xvf ${TARGET_FILE} || exit 1
rm ${TARGET_FILE}
mv ffmpeg-N-* ffmpeg-N || exit 1
cp -f ffmpeg-N//bin/* /usr/local/bin/ || exit 1
chmod 755 /usr/local/bin/ff* || exit 1
rm -Rf ffmpeg-N


