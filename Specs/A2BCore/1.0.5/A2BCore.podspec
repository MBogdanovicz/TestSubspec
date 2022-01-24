Pod::Spec.new do |spec|

  spec.name         = "A2BCore"
  spec.version      = "1.0.5"
  spec.summary      = "Core component of linksdk"

  spec.description  = <<-DESC
Core component of linksdk
                   DESC

  spec.homepage     = "https://www.a-to-be.com"

  spec.license      = { :type => 'BSD' }

  spec.author       = { "Marcelo Bogdanovicz" => "aub_mbogdanovicz@a-to-be.com" }

  spec.platform     = :ios, "12.3"

  #spec.source       = { :http => 'http://127.0.0.1:8080/coresdk/A2BCore.zip' }
  spec.source       = { :http => 'https://github.com/MBogdanovicz/TestSubspec/blob/main/A2BCore-1.0.5.zip?raw=true' }


  #spec.source_files  = "A2BCore/**/*.{h,swift}"
  spec.ios.vendored_frameworks = 'A2BCore.xcframework'
  spec.ios.deployment_target = '12.3'

  spec.swift_version = "5.0"

end
