#!/bin/bash -x
if [ $(whoami) != "root" ]; then
        echo "This script must be run as root"
        exit 1
fi

curl https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz -O || exit 1
tar xvf ffmpeg-git-amd64-static.tar.xz || exit 1
rm ffmpeg-git-amd64-static.tar.xz
mv ffmpeg-* ffmpeg-git || exit 1
cp -f ffmpeg-git/ff* /usr/local/bin/ || exit 1
cp -f ffmpeg-git/qt-faststart /usr/local/bin/ || exit 1
cp -Rf ffmpeg-git/model /usr/local/share/ffmpeg/ || exit 1
rm -Rf ffmpeg-git


