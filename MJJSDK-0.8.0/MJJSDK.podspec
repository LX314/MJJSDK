Pod::Spec.new do |s|
  s.name = 'MJJSDK'
  s.version = '0.8.0'
  s.summary = 'MJJSDK summary.'
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"LX314"=>"1094426094@qq.com"}
  s.homepage = 'https://github.com/LX314/MJJSDK'
  s.description = 'MJJSDK description.'
  s.source = {}

  s.platform = :ios, '8.0'
  s.ios.platform             = :ios, '8.0'
  s.ios.preserve_paths       = 'ios/MJJSDK.framework'
  s.ios.public_header_files  = 'ios/MJJSDK.framework/Versions/A/Headers/*.h'
  s.ios.resource             = 'ios/MJJSDK.framework/Versions/A/Resources/**/*'
  s.ios.vendored_frameworks  = 'ios/MJJSDK.framework'
end
