FROM quay.io/thoth-station/s2i-generic-data-science-notebook:latest

MAINTAINER Christopher Tate <computate@computate.org>

ENV APP_NAME=sumo \
	APP_DEPENDENCIES="rsync git python3 python3-pip make gcc gcc-c++ tcl zlib-devel libpng-devel libjpeg-turbo-devel libtiff-devel cmake xerces-c-devel proj-devel swig libsq3-devel libsqlite3x-devel" \
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

RUN yum install -y ${APP_DEPENDENCIES}

RUN pip install ansible sumolib pyproj
RUN git clone https://github.com/computate-org/computate_sumo.git /opt/app-root/src/.ansible/roles/computate.computate_sumo
RUN ansible-playbook -e  APP_PREFIX=/usr/local -e APP_DOWNLOAD_DIR=/tmp /opt/app-root/src/.ansible/roles/computate.computate_sumo/install.yml
RUN rm -rf /usr/local/src/sumo
RUN rm -rf /opt/app-root/src/.ansible
