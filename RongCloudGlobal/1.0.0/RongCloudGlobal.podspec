#
# RongCloudGlobal
#

Pod::Spec.new do |s|
# 1 info
s.name         = 'RongCloudGlobal'
s.version      = '1.0.0'
s.summary      = 'RongCloud Global IM Kit SDK.'
s.description  = <<-DESC
RongCloud Global IM Kit SDK for iOS.
DESC

# 2 source
s.homepage            = 'http://rongcloud.cn/'
s.license             = { :type => 'Copyright', :text => 'Copyright 2023 Rong Cloud' }
s.author              = { 'shaoshuai' => 'shaoshuai@rongcloud.cn' }
s.social_media_url    = 'http://www.rongcloud.cn'
s.source              = { :http => "https://downloads.rongcloud.cn/Rong_Cloud_iOS_Global_SDK_v1_0_0_dev.zip" }

# 3 config
s.platform        = :ios, '9.0'
s.requires_arc    = true

# 4 file
s.subspec 'IMUIKit' do |sub|
sub.vendored_frameworks = 'RongCloudGlobal/GlobalIMUIKit.xcframework'
sub.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
sub.dependency 'RongCloudIM/IMLibCore', '>=5.6.7'
end

# 5 dependency

end
