#
# Be sure to run `pod lib lint MJSDK-cocoapods.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MJSDK-cocoapods'
  s.version          = '1.2.1.6'
  s.summary          = 'summary of MJSDK-cocoapods.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/LX314/MJJSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LX314' => '1094426094@qq.com' }
  s.source           = { :git => 'https://github.com/LX314/MJJSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'MJSDK-cocoapods/Classes/**/*'
  
   s.resource_bundles = {
     'MJSDK-cocoapods' => ['MJSDK-cocoapods/Assets/*.png']
   }

#s.compiler_flags = '-DLEVELDB_PLATFORM_POSIX' , '-DOS_MACOSX'
#s.library = 'c++'
#s.xcconfig = {
#'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
#'CLANG_CXX_LIBRARY' => 'libc++'
#}

   s.public_header_files = 'MJSDK-cocoapods/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

s.frameworks = 'libicucore'
s.frameworks = 'libz'
s.frameworks = 'libstdc++'
s.frameworks = 'JavaScriptCore'
s.frameworks = 'CoreTelephony'
s.frameworks = 'libsqlite3'

s.dependency 'OpenSSL'
s.dependency 'AFNetworking'
s.dependency 'Masonry'
s.dependency 'Mantle'
s.dependency 'MBProgressHUD'
s.dependency 'SSKeychain'
s.dependency 'ReactiveCocoa', '~>2.0'

end
