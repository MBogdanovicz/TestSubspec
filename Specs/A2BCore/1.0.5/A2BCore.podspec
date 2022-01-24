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

  spec.source       = { :http => 'http://bit-develop-01.brisa.pt/nexus/repository/downloads/commons/ios-components/A2BCore-1.0.5.zip' }

  spec.ios.vendored_frameworks = 'A2BCore.xcframework'
  spec.ios.deployment_target = '12.3'

  spec.swift_version = "5.0"

  spec.subspec 'A2BVersioning' do |cs|
    cs.source       = { :http => 'http://bit-develop-01.brisa.pt/nexus/repository/downloads/commons/ios-components/A2BVersioning-1.0.3.zip' }
  end

end
