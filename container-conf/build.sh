#!/bin/bash
build_image_base=radiasoft/fedora
build_is_public=1
build_dockerfile_aux="USER $build_run_user"
build_docker_cmd='["'"$build_run_user_home/.dropbox-dist/dropboxd"'"]'

build_as_root() {
    install_yum_install libxshmfence-devel libXdamage-devel mesa-libglapi
}

build_as_run_user() {
    umask 022
    cd
    build_curl 'https://www.dropbox.com/download?plat=lnx.x86_64' | tar xzf -
    mkdir Dropbox
}
