
Pod::Spec.new do |s|

s.name         = "YFTools"
s.version      = "0.0.1"
s.summary      = "分装一些常用的工具和UI控件"

s.description  = <<-DESC
1.YFPageViewController
2.YFCollectionViewAutoFlowLayout(自定义流水布局)
3.YFIndicatorView
4.YFProgressHUD(可以显示Gif的HUD)
DESC

s.homepage     = "https://github.com/YFXPP/YFTool/tree/master/YFTool/YFTools"

s.license      = "MIT"
s.author             = { "ios_yangfei" => "16822hf@163.com" }
s.platform     = :ios, "8.0"
s.requires_arc = true
s.source       = { :git => "https://github.com/YFXPP/YFTool.git", :tag => "#{s.version}" }


s.source_files  = "YFTool/YFTools","YFTool/YFTool.h", "YFTool/YFTools/**/*.{h,m}"
s.exclude_files = ""


end

