Pod::Spec.new do |spec|

  spec.name           = "LCAppSandboxFileKit"

  spec.version        = "1.0.2"
  
  spec.summary        = "LCAppSandboxFileKit is a function to write and access files outside of the macOS application sandbox file!"

  spec.description    = <<-DESC
  LCAppSandboxFileKit is a framework for writing and accessing files outside of your macOS application's sandbox file! 
  It uses a simple, easy-to-understand dialog consistent with Apple's documentation to request permission from the user, 
  and uses secure bookmarks to retain permissions for the duration of your application!
                      DESC

  spec.homepage       = "https://github.com/DevLiuSir/LCAppSandboxFileKit"
  
  spec.license        = { :type => "MIT", :file => "LICENSE" }
  
  spec.author         = { "Marvin" => "93428739@qq.com" }

  spec.swift_versions = ['5.0']
  
  spec.platform       = :osx

  spec.osx.deployment_target = "10.14"

  spec.source       = { :git => "https://github.com/DevLiuSir/LCAppSandboxFileKit.git", :tag => "#{spec.version}" }

  spec.source_files   = "Sources/LCAppSandboxFileKit/**/*.{h,m,swift}"

  spec.resources      = ['Sources/LCAppSandboxFileKit/Resources/**/*.{lproj,strings}']


end
