
Pod::Spec.new do |s|
  s.name         = "BFPaperButton"
  s.version      = "1.3.0"
  s.summary      = "A flat button inspired by Google Material Design's Paper theme."
  s.homepage     = "https://github.com/bfeher/BFPaperButton"
  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       = { "Bence Feher" => "ben.feher@gmail.com" }
  s.source       = { :git => "https://github.com/bfeher/BFPaperButton.git", :tag => "1.3.0" }
  s.platform     = :ios, '7.0'
  s.dependency   'UIColor+BFPaperColors'
 
  
  s.source_files = 'Classes/*.{h,m}'
  s.requires_arc = true

end
