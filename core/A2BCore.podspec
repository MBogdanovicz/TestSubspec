Pod::Spec.new do |spec|

  spec.name         = "FRAMEWORK_NAME"
  spec.version      = "MARKETING_VERSION"
  spec.summary      = "Core component of linksdk"

  spec.description  = <<-DESC
Core component of linksdk
                   DESC

  spec.homepage     = "https://www.a-to-be.com"

  spec.license      = { :type => 'BSD' }

  spec.author       = { "Marcelo Bogdanovicz" => "aub_mbogdanovicz@a-to-be.com" }

  spec.platform     = :ios, "12.3"

  #spec.source       = { :http => 'http://127.0.0.1:8080/coresdk/FRAMEWORK_NAME.zip' }
  spec.source       = { :http => 'http://bit-develop-01.brisa.pt/nexus/repository/downloads/commons/ios-components/FRAMEWORK_NAME-MARKETING_VERSION.zip' }


  #spec.source_files  = "FRAMEWORK_NAME/**/*.{h,swift}"
  spec.ios.vendored_frameworks = 'FRAMEWORK_NAME.xcframework'
  spec.ios.deployment_target = '12.3'

  spec.swift_version = "5.0"

end