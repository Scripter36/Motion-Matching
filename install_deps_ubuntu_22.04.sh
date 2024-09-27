#!/usr/bin/env sh

# 1. install dependencies
sudo apt update
sudo apt install -y git build-essential
sudo apt install -y libasound2-dev libx11-dev libxrandr-dev libxi-dev libgl1-mesa-dev libglu1-mesa-dev libxcursor-dev libxinerama-dev libwayland-dev libxkbcommon-dev

# 2. install submodules
git submodule update --init --recursive --depth=1
