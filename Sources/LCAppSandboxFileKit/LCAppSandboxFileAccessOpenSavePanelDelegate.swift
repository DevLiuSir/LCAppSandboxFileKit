//
//  LCAppSandboxFileAccessOpenSavePanelDelegate.swift
//  IPSWLibrary
//
//  Created by DevLiuSir on 2019/12/20.
//


import Cocoa

/// 应用程序`沙盒文件访问`打开` SavePanel 委托`
class LCAppSandboxFileAccessOpenSavePanelDelegate: NSObject, NSOpenSavePanelDelegate {
    
    /// 文件URL的路径组件
    var pathComponents: [String]

    /// 是否允许选择目录，默认为 `false`
    /// 当为 `true` 时，用户可以选择目录；当为 `false` 时，用户只能选择文件。
    var canChooseDirectories: Bool = false

    /// 初始化方法
    /// - Parameter fileURL: 要处理的文件URL
    /// - Parameter canChooseDirectories: 是否允许选择目录
    /// 初始化方法用于创建一个 `LCAppSandboxFileAccess` 实例并设置其属性。
    init(fileURL: URL, canChooseDirectories: Bool) {
        // 确保fileURL参数不为nil
        precondition(fileURL.absoluteString.isEmpty == false, "fileURL must not be nil")
        
        // 使用文件URL的路径组件初始化pathComponents属性
        self.pathComponents = fileURL.pathComponents
        
        // 设置是否允许选择目录
        self.canChooseDirectories = canChooseDirectories
    }
    
    
    /* ------ 可以选择文件夹 -------*/
    
    // MARK: - NSOpenSavePanelDelegate
    
    /// 检查URL是否可用于选择
    /// - Parameters:
    ///   - sender: 发送者
    ///   - url: 要检查的URL
    /// - Returns: 如果允许选择，则为true；否则为false。
    func panel(_ sender: Any, shouldEnable url: URL) -> Bool {
        // 确保url参数不为nil
        precondition(url.absoluteString.isEmpty == false, "url 不能为空")
        
        /// 获取`文件URL`的`路径组件`
        let pathComponents = self.pathComponents
        
        /// 获取传入的URL的路径组件
        let otherPathComponents = url.pathComponents
        
        // 如果传入的URL的路径组件数量多于self.url的路径组件数量，允许选择，表示选择的是self.url的子文件或子文件夹
        if otherPathComponents.count > pathComponents.count {
            return canChooseDirectories    // true: 允许 选择文件夹  false：不允许选择文件夹
        }
        
        // 遍历传入的URL的每个路径组件，与self.url的相应组件进行比较
        for i in 0..<otherPathComponents.count {
            let comp1 = otherPathComponents[i]
            let comp2 = pathComponents[i]
            
            // 如果有任何不匹配，不允许选择，表示选择的不是self.url的子文件或子文件夹
            if comp1 != comp2 {
                return false
            }
        }
        
        // 没有不匹配的情况，允许选择，表示选择的是self.url的子文件或子文件夹
        return true
    }
    
    
}
