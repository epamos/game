#!/bin/bash

if [ ! -d "lib" ]; then
  mkdir lib
fi
cd lib
if [ ! -d "glew-2.1.0" ]; then
  wget "https://downloads.sourceforge.net/project/glew/glew/2.1.0/glew-2.1.0.tgz"
  tar -xf glew-2.1.0.tgz
  rm glew-2.1.0.tgz
fi

if [ ! -d "glfw-3.3" ]; then
  wget "https://github.com/glfw/glfw/releases/download/3.3/glfw-3.3.zip"
  unzip glfw-3.3.zip
  rm glfw-3.3.zip
fi
