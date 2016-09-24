Pod::Spec.new do |s|

  s.name = "SwiftAnnuity"

  s.version = "1.0.1"

  s.summary = "Swift library used to calculate annuity rates."

  s.description = <<-DESC
                  It provides an object wrapper to be able to calculate
                  annuity rates for example for a fixed rate over time
                  such as mortgage repayments.
                  DESC

  s.homepage = "https://github.com/superwatermelon/SwiftAnnuity"

  s.license = "MIT"

  s.author = { "Stuart Wakefield" => "stuart@superwatermelon.com" }

  s.platform = :ios, '9.2'

  s.source = {
    :git => "https://github.com/superwatermelon/SwiftAnnuity.git",
    :tag => "#{s.version}"
  }

  s.source_files = "Sources/**/*.swift"

  s.dependency "SwiftDecimalNumber", "~> 1.0.3"

end
