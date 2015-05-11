Pod::Spec.new do |s|
  s.name             = "APUtil"
  s.version          = "0.1"
  s.summary          = "Categories utilities for Cocoa Classes"
  s.homepage         = "https://github.com/flavionegrao/APUtil"
  s.license          = 'MIT'
  s.author           = { "Flavio Negrao Torres" => "flavio@apetis.com" }

  s.source           = { :git => "https://github.com/flavionegrao/APUtil.git", :tag => "#{s.version}" }
  s.source_files     = "APUtil/**"

  s.ios.deployment_target = '7.1'
  s.requires_arc = true

end

