Pod::Spec.new do |s|
  s.name = 'LXTool'
  s.version = '0.6.0'
  s.summary = 'LXTool summary.'
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"LX314"=>"1094426094@qq.com"}
  s.homepage = 'https://github.com/LX314/MJJSDK'
  s.description = 'LXTool description.'
  s.source = {}

  s.platform = :ios, '8.0'
  s.ios.platform             = :ios, '8.0'
  s.ios.preserve_paths       = 'ios/LXTool.framework'
  s.ios.public_header_files  = 'ios/LXTool.framework/Versions/A/Headers/*.h'
  s.ios.resource             = 'ios/LXTool.framework/Versions/A/Resources/**/*'
  s.ios.vendored_frameworks  = 'ios/LXTool.framework'
end
