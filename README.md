# ncmdump

使用本程序可将下载的网易云音乐缓存文件（ncm）转换为 mp3 或 flac 格式

## 简介

该版本为最早的 C++ 版本，也是作者开发的市面上第一个支持 ncm 转换的程序

源码复刻自 anonymous5l/ncmdump，感谢前辈的付出！做了 Windows 下的移植，修复了一些编译问题

1.3.0 版本更新说明：因为之前有小伙伴反馈无法解密带有特殊字符的文件名，例如中文、日文、韩文或者是表情符号等，在1.3.0以及之后的版本彻底修复了这个问题，所有的 UTF-8 字符都可以正常解密。并且还自带了 dll 的构建，可以供其他应用程序（C#、Python、Java等）调用。

## 传送门

2021年10月6日，原作者已经删库

## 使用

### 命令行工具

你可以使用 Homebrew 来安装 ncmdump 的 cli 版本

```shell
brew install ncmdump
```

或者从 [Release](https://github.com/lewime/ncmdump/releases) 下载最新版本的对应系统的已编译好的二进制文件

使用 `-h` 或 `--help` 参数来打印帮助

```shell
ncmdump -h
```

命令行下输入一个或多个文件

```shell
ncmdump file1 file2...
```

你可以使用 `-d` 参数来指定一个文件夹，对文件夹下的所有文件批量处理

```shell
ncmdump -d folder
```

### 动态库

或者，如果你想利用此项目进行二次开发，例如在你的 C#、Python、Java 等项目中调用，你可以使用 `libncmdump` 动态库，具体使用方法见仓库的 `example` 文件夹

请注意！如果你在 Windows 下开发，传递到库构造函数的文件名编码**必须为 UTF-8 编码**，否则会抛出运行时错误。

## 编译项目

克隆本仓库

```shell
git clone https://github.com/lewime/ncmdump.git
```

更新子模块

```shell
cd ncmdump
git submodule update --init --recursive
```

使用 CMake 配置项目。Windows 下若使用 GNU 套件，推荐使用 [msys2](https://www.msys2.org/) 或者 [winlibs](https://winlibs.com/)

```shell
# Windows MinGW
cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release -B build

# Windows MSVC
cmake -G "Visual Studio 17 2022" -A x64 -B build

# Linux / macOS
cmake -DCMAKE_BUILD_TYPE=Release -B build
```

编译项目

```shell
# Windows MSVC 需要在构建阶段指定 --config Release
cmake --build build -j 8 --config Release

# Windows MinGW / Linux / macOS
cmake --build build -j 8
```

你可以在 `build` 文件夹下找到编译好的二进制文件，以及一个可供其它项目使用的动态库(Windows Only)，使用方法见仓库的 `example` 文件夹

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=lewime/ncmdump&type=Date)](https://star-history.com/#lewime/ncmdump&Date)
