Pod::Spec.new do |s|
  s.name         = "MBBlinkIDUI"
  s.version      = "4.10.0.0"
  s.summary      = "A delightful component for document scanning with customizable UI."
  s.description  = <<-DESC
                  BlinkIDUI is a delightful component for quick and easy scanning of ID cards, passports, and driver’s licenses. The SDK is powered by [Microblink’s](http://www.microblink.com) industry-proven and world leading OCR and barcode scanning technology, and offers:

                        - integrated camera management
                        - simple and customizable UI
                        - lightweight
                        - no Internet connection required
                        - enteprise-level security standards
                        - data parsing from ID barcode standards

                  BlinkIDUI is a part of [Microblink’s](http://www.microblink.com) range of SDKs developed for text recognition, barcode scanning, ID document scanning, and many others.
        DESC

  s.homepage     = "http://microblink.com"
  s.license     = { 
        :type => 'commercial',
        :text => <<-LICENSE
                © 2013-2019 MicroBlink Ltd. All rights reserved.
                LICENSE
        }
  s.author             = {
          "MicroBlink" => "info@microblink.com"
  }
  s.platform     = :ios, "9.0"
  s.source       = { git: 'https://github.com/BlinkID/blinkid-ui-ios.git', :tag => 'v4.10.0.0' }
  s.source_files  = "BlinkIDUI/**/*.{h,swift,xib,storyboard}"
  s.exclude_files = "Samples", "Frameworks", "docs"
  s.module_name = "BlinkIDUI"
  s.resources = "BlinkIDUI/**/Resources/Assets*", "BlinkIDUI/**/Resources/*.strings"
  s.dependency "PPBlinkID", "~> 4.10.0"
  s.swift_version = '5.0'
end
