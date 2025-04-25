//
//  LCAppSandboxFileKit.swift
//  
//
//  Created by DevLiuSir on 2019/12/20.
//

import Foundation



/// 应用沙盒文件kit
public class LCAppSandboxFileKit: NSObject {
    
    /// 创建一个单例对象，方便在整个应用中使用
    public static let standard = LCAppSandboxFileKit()
    
    /// 请求访问`指定路径` (一般用于 `/` 根目录)
    /// - Parameters:
    ///   - path: 需要访问的路径
    ///   - title: 可选，授权提示框的标题文本，默认会拼接应用名称；如果未提供，则使用默认本地化标题。
    ///   - panelButtonTitle: 可选，授权窗口中按钮的标题（例如“授权），如果未提供，则使用默认值。
    ///   - canChooseDirectories: 是否允许选择目录。如果为 `true`，用户可以选择目录；如果为 `false`，用户只能选择文件。
    ///   - completion: 当访问路径完成时的回调，如果成功获取路径权限，则返回 true，否则返回 false
    public func requestAccessForPath(_ path: String, title: String? = nil, panelButtonTitle: String? = nil, canChooseDirectories: Bool, completion: @escaping (Bool) -> Void) {
        
        // 创建一个沙盒文件访问对象
        let fileAccess = LCAppSandboxFileAccess()
        
        // 设置标题和消息
        if let customTitle = title, !customTitle.isEmpty {
            // 如果传入了自定义标题，拼接应用名并设置消息
            let fullTitle = "\(KApplicationName) \(customTitle)"
            fileAccess.title = fullTitle
            fileAccess.message = String(format: fullTitle, KApplicationName)
        } else {
            // 使用初始化时默认的 title 和消息
            fileAccess.message = String(format: fileAccess.title, KApplicationName)
        }
        
        // 设置按钮文本 prompt
        fileAccess.panelButtonTitle = panelButtonTitle ?? fileAccess.panelButtonTitle
        
        // 设置是否允许选择目录
        fileAccess.canChooseDirectories = canChooseDirectories
        
        // 尝试访问指定路径，并在成功时调用回调
        let result = fileAccess.accessFilePath(path, persistPermission: true) {
            // 成功获取权限，调用回调并传入 true
            completion(true)
        }
        
        // 如果尝试访问路径失败，则调用回调并传入 false
        if result == false {
            completion(false)
        }
    }
    
    
    /// 检查是否有`指定路径`的访问权限
    /// - Parameter path: 要检查的文件路径
    /// - Returns: 如果当前应用有访问该路径的权限则返回 true，否则返回 false
    public func checkAccessForPath(_ path: String) -> Bool {
        return LCAppSandboxFileAccess.checkAccessForPath(path)
    }
    
    /// 检查是否有`指定文件URL`的访问权限
    /// - Parameter url: 要检查的文件URL
    /// - Returns: 如果当前应用有访问该URL的权限则返回 true，否则返回 false
    public func checkAccessForURL(_ url: URL) -> Bool {
        return LCAppSandboxFileAccess.checkAccessForURL(with: url)
    }
    
    
    /// 清除`指定路径`的`访问权限`
    /// - Parameters:
    ///   - path: 需要清除访问权限的路径   (一般用于 `/` 根目录)
    ///   - completion: 当清除访问权限完成时的回调，如果成功清除权限，则返回 true，否则返回 false
    public func clearAccessForPath(_ path: String, completion: @escaping (Bool) -> Void) {
        // 创建一个沙盒文件访问对象
        let fileAccess = LCAppSandboxFileAccess()
        
        // 创建一个文件URL
        let url = URL(fileURLWithPath: path)
        
        // 尝试取消指定路径的权限
        fileAccess.accessPersist.clearBookmarkData(for: url)
        
        // 现在我们假设 `clearBookmarkData(for:)` 方法总是成功的, 调用回调返回 true
        completion(true)
    }
    
    
    /// 清除`所有保存`的书签数据
    public func clearAllBookmarkData() {
        let defaults = UserDefaults.standard
        let allKeys = defaults.dictionaryRepresentation().keys
        
        for key in allKeys where key.hasPrefix("bd_") {
            defaults.removeObject(forKey: key)
        }
    }
    
}
