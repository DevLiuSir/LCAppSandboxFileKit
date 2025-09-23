//
//  AppDelegate.swift
//  LCAppSandboxFileKitDemo
//
//  Created by DevLiuSir on 2021/9/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    

    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        LCAppSandboxFileKit.standard.requestAccessForPath("/Users", isRootOptionEnabled: true, canChooseDirectories: true) { status in
            if status {
                print("已经有权限了，开始处理")
            } else {
                print("获取权限失败")
            }
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

