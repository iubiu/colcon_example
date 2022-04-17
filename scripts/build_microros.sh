#!/bin/bash
colcon --log-base out/log build --build-base out/build --install-base out/install --packages-up-to rosidl_typesupport_microxrcedds_c --metas ./ --cmake-args -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON $@
colcon --log-base out/log build --build-base out/build --install-base out/install --packages-up-to rosidl_typesupport_microxrcedds_cpp --metas ./ --cmake-args -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON $@

set +o nounset
. out/install/local_setup.bash
set -o nounset

colcon --log-base out/log build --build-base out/build --install-base out/install --metas ./colcon.meta --packages-skip-up-to micro_ros_agent --packages-ignore builtin_interfaces --cmake-args -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON $@
