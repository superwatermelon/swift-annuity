Pod::Spec.new do |s|
  s.name         = "SwiftAnnuity"
  s.version      = "0.1.0"
  s.summary      = "A short description of SwiftAnnuity."
  s.description  = <<-DESC
                   DESC
  s.homepage     = "http://EXAMPLE/SwiftAnnuity"
  s.license      = "MIT"
  s.author             = { "Stuart Wakefield" => "stuart@superwatermelon.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "http://EXAMPLE/SwiftAnnuity.git", :tag => "#{s.version}" }
  s.source_files  = "SwiftAnnuity/**/*"
  s.exclude_files = "Classes/Exclude"
  s.requires_arc = true
  s.dependency "SwiftDecimalNumber", "~> 0.2"
end
