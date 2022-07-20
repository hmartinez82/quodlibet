#!/usr/bin/env bash
# Copyright 2016 Christoph Reiter
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

set -e

function main {

    case $MSYSTEM in
    MINGW32)
        local MSYS2_ARCH="i686"
        ;;
    MINGW64)
        local MSYS2_ARCH="x86_64"
        ;;
    CLANG32)
        local MSYS2_ARCH="clang-i686"
        ;;
    CLANG64)
        local MSYS2_ARCH="clang-x86_64"
        ;;
    CLANGARM64)
        local MSYS2_ARCH="clang-aarch64"
        ;;    
    *)
        echo -n "Unsupported architecture: $MSYSTEM"
        exit -1
        ;;
    esac

    pacman --noconfirm -Suy

    pacman --noconfirm -S --needed \
        git \
        base-devel \
        mingw-w64-$MSYS2_ARCH-gettext \
        mingw-w64-$MSYS2_ARCH-gdk-pixbuf2 \
        mingw-w64-$MSYS2_ARCH-librsvg \
        mingw-w64-$MSYS2_ARCH-gtk3 \
        mingw-w64-$MSYS2_ARCH-libsoup \
        mingw-w64-$MSYS2_ARCH-gstreamer \
        mingw-w64-$MSYS2_ARCH-gst-plugins-base \
        mingw-w64-$MSYS2_ARCH-gst-plugins-good \
        mingw-w64-$MSYS2_ARCH-libsrtp \
        mingw-w64-$MSYS2_ARCH-gst-plugins-bad \
        mingw-w64-$MSYS2_ARCH-gst-libav \
        mingw-w64-$MSYS2_ARCH-gst-plugins-ugly \
        mingw-w64-$MSYS2_ARCH-toolchain

    pacman --noconfirm -S --needed \
        mingw-w64-$MSYS2_ARCH-python3 \
        mingw-w64-$MSYS2_ARCH-python3-gobject \
        mingw-w64-$MSYS2_ARCH-python3-cairo \
        mingw-w64-$MSYS2_ARCH-python3-pip \
        mingw-w64-$MSYS2_ARCH-python3-pytest \
        mingw-w64-$MSYS2_ARCH-python3-certifi \
        mingw-w64-$MSYS2_ARCH-python3-coverage \
        mingw-w64-$MSYS2_ARCH-python3-flake8

    pip3 install --user -U feedparser musicbrainzngs mutagen
}

main;
