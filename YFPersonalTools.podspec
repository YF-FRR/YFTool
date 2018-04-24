
Pod::Spec.new do |s|

s.name         = "YFPersonalTools"
s.version      = "0.0.4"
s.summary      = "封装一些常用的工具和UI控件"

s.description  = <<-DESC
1.YFPageViewController
2.YFCollectionViewAutoFlowLayout(自定义流水布局)
3.YFIndicatorView
4.YFProgressHUD(可以显示Gif的HUD)
DESC

s.homepage     = "https://github.com/YFXPP/YFTool/tree/master/YFTool/YFTools"

s.license      = "MIT"
s.author             = { "ios_yangfei" => "" }
s.platform     = :ios, "8.0"
s.requires_arc = true
s.source       = { :git => "https://github.com/YFXPP/YFTool.git", :tag => "#{s.version}" }


s.source_files  = "YFTool/YFTool.h","YFTool/YFToolDefine.h","YFTool/YFPickerViewDefine.h", "YFTool/YFTools/UIView+Extension/**/*.{h,m}", "YFTool/YFTools/YFCollectionViewAutoFlowLayout/**/*.{h,m}", "YFTool/YFTools/YFIndicatorView/**/*.{h,m}", "YFTool/YFTools/YFPageViewController/**/*.{h,m}", "YFTool/YFTools/YFProgressHUD/**/*.{h,m}", "YFTool/YFTools/YFPickerView/**/*.{h,m}"
s.exclude_files = ""


end

