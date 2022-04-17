#! /bin/bash

set -e
set -o nounset
set -o pipefail

echo "Building micro-ROS Agent"

set +o nounset
. out/install/local_setup.bash
set -o nounset

colcon --log-base out/log build --build-base out/build --install-base out/install --packages-up-to micro_ros_agent $@ --cmake-args \
    "-DUAGENT_BUILD_EXECUTABLE=OFF" \
    "-DUAGENT_P2P_PROFILE=OFF" \
    "--no-warn-unused-cli"
