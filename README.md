# colcon-example
edit by StackEdit Online: https://stackedit.io/

colcon （collective construction）是为 ROS2 开发的构建工具，是 catkin_make、ament tools 迭代版本，不仅支持 ament_make 构建的包，还支持纯 cmake 的包。

实现原理是遍历目录下的 CMakeLists.txt，针对每个包设置 CMAKE_INSTALL_PREFIX、CMAKE_PREFIX_PATH 等环境变量以实现在每个包可以用 find_package() 等 Module CMake 的功能，实现模块的解耦。

注意：纯 CMake 的包无需 package.xml 文件，复杂的依赖关系需要注意编译顺序，可能需要分次执行 colcon 避免依赖的包还未生成，但是 ament_make 的包可以通过 package.xml 实现依赖管理。

文档地址：https://colcon.readthedocs.io/en/released/

# 一个简单的例子
本例中有三个纯 CMake 包，add_three 依赖 add_two，myapp 依赖 add_three，使用 colcon build 即可完成编译，注意，只有 ament_make 的包才能导出到 ROS2。 

# 常用的选项
## 指定生成文件路径
注意：--log-base 应该位于 build 前，--cmake-args 将为每一个要编译的包添加编译参数
```
colcon --log-base out/log build --build-base out/build --install-base out/install --cmake-args \
    "-DUAGENT_BUILD_EXECUTABLE=OFF"
```
## 一些有用的包管理参数
--packages-up-to 
编译此包及依赖的所有包
```
colcon build --packages-up-to  pkg1 pkg2 pkg3
```
--packages-select
编译选中的包。若无并行编译，此处编译顺序为参数顺序
```
colcon build --packages-select pkg1 pkg2 pkg3
```
## 其他有用的参数
--metas  src
可以一次指定多个包的编译参数，可见 repo 中的 colcon.meta

注意：未指定 meta 文件时，默认为 src/colcon.meta
### 每个包特定的 CMake 参数
在每个包根目录编写 colcon.pkg 可以指定特定的包参数
### 忽略某个目录
含有 COLCON_IGNORE 文件的目录不会被 colcon 编译
