Pod::Spec.new do |spec|

  spec.name         = "A2BVersioning"
  spec.version      = "1.0.3"
  spec.summary      = "Versioning component of linksdk"

  spec.description  = <<-DESC
Versioning component of linksdk
                   DESC

  spec.homepage     = "https://www.a-to-be.com"

  spec.license      = { :type => 'BSD' }

  spec.author       = { "Marcelo Bogdanovicz" => "aub_mbogdanovicz@a-to-be.com" }

  spec.platform     = :ios, "12.3"

  spec.source       = { :http => 'http://bit-develop-01.brisa.pt/nexus/repository/downloads/commons/ios-components/A2BVersioning-1.0.3.zip' }

  spec.ios.vendored_frameworks = 'A2BVersioning.xcframework'
  spec.ios.deployment_target = '12.3'

  spec.dependency 'A2BCore', '1.0.5'
  spec.frameworks = 'A2BCore'

  spec.swift_version = "5.0"

end
