Pod::Spec.new do |s|

  s.name         = "RandomColorSwift"
  s.version      = "0.1.0"
  s.summary      = "An attractive color generator for Swift. Ported from randomColor.js."

  s.description  = <<-DESC
                   A tiny library for generating attractive random colors.

                   It produces bright colors with a reasonably high saturation. 
                   This makes randomColor particularly useful for data visualizations and generative art.
                   DESC

  s.homepage     = "https://github.com/onevcat/RandomColorSwift"
  
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.authors            = { "onevcat" => "onevcat@gmail.com" }
  s.social_media_url   = "http://twitter.com/onevcat"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"

  s.source       = { :git => "https://github.com/onevcat/RandomColorSwift.git", :tag => s.version }

  s.source_files  = "RandomColor/*.swift"
  s.requires_arc = true

end
