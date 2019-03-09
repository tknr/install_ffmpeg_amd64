#!/bin/bash -x
echo "this command must be executed in root user."
curl https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz -O || exit 1
tar xvf ffmpeg-git-amd64-static.tar.xz || exit 1
rm ffmpeg-git-amd64-static.tar.xz
mv ffmpeg-* ffmpeg-git || exit 1
sudo cp -f ffmpeg-git/ff* /usr/local/bin/ || exit 1
sudo cp -f ffmpeg-git/qt-faststart /usr/local/bin/ || exit 1
sudo cp -Rf ffmpeg-git/model /usr/local/share/ffmpeg/ || exit 1
rm -Rf ffmpeg-git


