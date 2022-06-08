#!/bin/zsh
set -eu
pw=`pwd`
package=`basename $pw`
echo $package
cd $HOME/dev_ws &&\
    colcon build --symlink --packages-select $package
