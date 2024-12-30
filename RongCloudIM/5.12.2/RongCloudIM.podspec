#
#  Be sure to run `pod spec lint MVoIP.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#


Pod::Spec.new do |s|


  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #


  s.name         = "RongCloudIM"
  s.version      = "5.12.2"
  s.summary      = "RongCloud IM SDK.(如果看不到最新版本，请使用 pod repo update 命令更新一下本地pod仓库，从 2.9.0 版本开始这里不再包含 CallKit 和 CallLib 类库的管理，音视频服务升级为融云自有音视频，2.9.0 版本之前用户请根据站内信提示更新)"


  s.description  = <<-DESC
                   RongCloud IM SDK for iOS.


                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC


  s.homepage     = "http://rongcloud.cn/"
  s.license      = { :type => "Copyright", :text => "Copyright 2014 Rong Cloud" }
  s.author             = { "litao" => "litao@rongcloud.cn" }
  s.social_media_url   = "http://www.rongcloud.cn"
  s.platform     = :ios, "7.0"
  s.source       = { :http => "https://downloads.rongcloud.cn/Rong_Cloud_iOS_IM_SDK_v5_12_2_Dev.zip" }
  #s.default_subspec = 'IMLib', 'IMKit'
  s.requires_arc = true
  
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.subspec 'IMLib' do |lib|
    lib.vendored_frameworks = "RongCloudIM/RongIMLib.framework"
    lib.libraries = "stdc++", "sqlite3", "z"
    lib.frameworks = "WebKit"
    lib.resources = "RongCloudIM/RCConfig.plist"
    lib.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
    lib.vendored_libraries = "RongCloudIM/libopencore-amrnb.a","RongCloudIM/libopencore-amrwb.a","RongCloudIM/libvo-amrwbenc.a"
  end

  s.subspec 'IMKit' do |kit|
      kit.resources = "RongCloudIM/RongCloud.bundle", "RongCloudIM/en.lproj", "RongCloudIM/zh-Hans.lproj", "RongCloudIM/Emoji.plist", "RongCloudIM/RCColor.plist"
      kit.vendored_frameworks = "RongCloudIM/RongIMKit.framework"
      kit.frameworks = "AssetsLibrary", "MapKit", "ImageIO", "CoreLocation", "SystemConfiguration", "QuartzCore", "OpenGLES", "CoreVideo", "CoreTelephony", "CoreMedia", "CoreAudio", "CFNetwork", "AudioToolbox", "AVFoundation", "UIKit", "CoreGraphics", "SafariServices"
      kit.dependency 'RongCloudIM/IMLib'
  end

  s.subspec 'RongSticker' do |rs|
      rs.vendored_frameworks = "RongCloudIM/RongSticker.framework"
      rs.resources = 'RongCloudIM/RongSticker.bundle','RongCloudIM/zh-Hans.lproj','RongCloudIM/en.lproj'
      rs.dependency 'RongCloudIM/IMKit'
  end

  s.subspec 'Sight' do |st|
      st.vendored_frameworks = "RongCloudIM/RongSight.framework"
      st.dependency 'RongCloudIM/IMKit'
  end

  # s.subspec 'Sticker' do |st|
  #     st.vendored_frameworks = "RongCloudIM/BQMMRongCloudExt.framework"
  #     st.resources = "RongCloudIM/BQMM.bundle"
  #     st.libraries = "z"
  #     st.dependency 'RongCloudIM/IMKit'
  # end

end
