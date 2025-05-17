<p align="center">
<img src="./Design/Icons.jpg" width="500">

<p align="center"> <b> LCAppSandboxFileKit is a framework for writing and accessing files outside of the macOS application sandbox file!</b></p>

<p align="center">
  <a href="https://swiftpackageindex.com/DevLiuSir/LCAppSandboxFileKit">
        <img src="https://img.shields.io/endpoint?url=https://swiftpackageindex.com/api/packages/DevLiuSir/LCAppSandboxFileKit/badge?type=swift-versions" alt="Swift Versions">
    </a>
    <a href="https://swiftpackageindex.com/DevLiuSir/LCAppSandboxFileKit">
        <img src="https://img.shields.io/endpoint?url=https://swiftpackageindex.com/api/packages/DevLiuSir/LCAppSandboxFileKit/badge?type=platforms" alt="Supported Platforms">
    </a>
<img src="https://badgen.net/badge/icon/apple?icon=apple&label">
<img src="https://img.shields.io/badge/language-swift-orange.svg">
<img src="https://img.shields.io/badge/macOS-10.14-blue.svg">
<img src="https://img.shields.io/badge/build-passing-brightgreen">
<img src="https://img.shields.io/github/languages/top/DevLiuSir/LCAppSandboxFileKit?color=blueviolet">
<img src="https://img.shields.io/github/license/DevLiuSir/LCAppSandboxFileKit.svg">
<img src="https://img.shields.io/github/languages/code-size/DevLiuSir/LCAppSandboxFileKit?color=ff69b4&label=codeSize">
<img src="https://img.shields.io/github/repo-size/DevLiuSir/LCAppSandboxFileKit">
<img src="https://img.shields.io/github/last-commit/DevLiuSir/LCAppSandboxFileKit">
<img src="https://img.shields.io/github/commit-activity/m/DevLiuSir/LCAppSandboxFileKit">
<img src="https://img.shields.io/github/stars/DevLiuSir/LCAppSandboxFileKit.svg?style=social&label=Star">
<img src="https://img.shields.io/github/forks/DevLiuSir/LCAppSandboxFileKit?style=social">
<img src="https://img.shields.io/github/watchers/DevLiuSir/LCAppSandboxFileKit?style=social">
<a href="https://twitter.com/LiuChuan_"><img src="https://img.shields.io/twitter/follow/LiuChuan_.svg?style=social"></a>
</p>




> [中文](README_CN.md) | [English](README.md)





## How to use

- Define the path for which authorization is required

```swift
let authorizedDirectory = "/"

```


- Clear the access permissions of the specified path


```swift
LCAppSandboxFileKit.standard.clearAccessForPath(authorizedDirectory) { status in
    if status {
        print("Successfully cleared access to the root directory.")
    } else {
        print("Failed to clear access to the root directory.")
    }
}
```



- Clear access permissions for all paths

```swift
LCAppSandboxFileKit.standard.clearAllBookmarkData()
```



- Check if the directory has access permissions

```swift
let isPermiss = LCAppSandboxFileKit.standard.checkAccessForPath(authorizedDirectory)
if isPermiss {
    print("Directory access granted, starting search.")
} else { // No access, request permission
    print("No directory access, requesting permission.")
    LCAppSandboxFileKit.standard.requestAccessForPath(authorizedDirectory, canChooseDirectories: true) { status in
        if status {
            print("Permission granted, proceeding with the process.")
        } else {
            print("Failed to obtain permission.")
        }
    }
}
```



- Request access permissions for the specified path，Customize panel information

```swift
LCAppSandboxFileKit.standard.requestAccessForPath("/", title: "custom title", panelButtonTitle: "button title", canChooseDirectories: true) { status in
     if status {
        print("Permission granted, proceeding with the process.")
    } else {
        print("Failed to obtain permission.")
    }
}
```



- Request access to the specified path and whether to display the attachment view

```swift
 LCAppSandboxFileKit.standard.requestAccessForPath("/Users", isRootOptionEnabled: true, canChooseDirectories: true) { status in
     if status {
        print("Permission granted, proceeding with the process.")
    } else {
        print("Failed to obtain permission.")
    }
}
```



### Design
| ![](Design/preview-02.png) |
| :------------: |
| Accessory panel |

| ![](Design/preview-01.png)|
| :------------: |
| Normal |




## Installation

### CocoaPods
PermissionsKit is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```swift

pod 'LCAppSandboxFileKit'

```



### SwiftPackage

Add `https://github.com/DevLiuSir/LCAppSandboxFileKit.git` in the [“Swift Package Manager” tab in Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).


## License

MIT License

Copyright (c) 2024 Marvin


## Author

| [<img src="https://avatars2.githubusercontent.com/u/11488337?s=460&v=4" width="120px;"/>](https://github.com/DevLiuSir)  |  [DevLiuSir](https://github.com/DevLiuSir)<br/><br/><sub>Software Engineer</sub><br/> [<img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/twitter.svg" height="20" width="20"/>][1] [<img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/github.svg" height="20" width="20"/>][2] [<img align="center" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" height="20" width="20"/>][3]|
| :------------: | :------------: |

[1]: https://twitter.com/LiuChuan_
[2]: https://github.com/DevLiuSir
[3]: https://devliusir.com/