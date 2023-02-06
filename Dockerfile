FROM quay.io/thoth-station/s2i-generic-data-science-notebook:latest

MAINTAINER Christopher Tate <computate@computate.org>

ENV APP_NAME=sumo \
	APP_DEPENDENCIES="rsync git python3 python3-pip python3-virtualenv make gcc gcc-c++ readline-devel tcl zlib-devel libpng-devel libjpeg-turbo-devel libtiff-devel libXext-devel libXft-devel mesa-libGLw mesa-libGL-devel mesa-libGLU-devel cmake xerces-c-devel proj-devel gl2ps-devel swig java-11-openjdk-devel maven libsq3-devel libsqlite3x-devel" \
	# gtest-devel gdal-devel ffmpeg-devel
	APP_DISPLAY_NAME="SUMO Simulation of Urban Mobility Data Science Notebook" \
	APP_PREFIX="/usr/local" \
	APP_SRC="/usr/local/src/sumo" \
	APP_SHARE="/usr/local/share/sumo" \
	APP_REPO_HTTPS="https://github.com/eclipse/sumo.git" \
	APP_TAG="v1_12_0" \
	APP_EXEC="/usr/local/bin/sumo-gui" \
	PYTHON_DIR="/opt/python" \
	SUMO_HOME="/usr/local/share/sumo" \
	LD_LIBRARY_PATH="/usr/local/lib:/usr/local/lib64"

USER root

RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN rpm -ivh https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
