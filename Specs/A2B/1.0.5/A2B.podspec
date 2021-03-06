Pod::Spec.new do |spec|

  spec.name         = "A2B"
  spec.version      = "1.0.5"
  spec.summary      = "Core component of linksdk"

  spec.description  = <<-DESC
Core component of linksdk
                   DESC

  spec.homepage     = "https://www.a-to-be.com"

  spec.license      = { :type => 'BSD' }

  spec.author       = { "Marcelo Bogdanovicz" => "aub_mbogdanovicz@a-to-be.com" }

  spec.platform     = :ios, "12.3"

  spec.source       = { :git => 'https://github.com/MBogdanovicz/TestSubspec.git' }

  #spec.ios.vendored_frameworks = 'A2BCore.xcframework'
  spec.ios.deployment_target = '12.3'

  spec.swift_version = "5.0"

  # Exclude optional Search and Testing modules
  spec.default_subspec = 'Core'

  ### Subspecs

  spec.subspec 'Core' do |cs|
    cs.dependency 'A2B/A2BVersioning'
    cs.dependency 'A2B/A2BCore'
  end

  spec.subspec 'A2BVersioning' do |cs|
    cs.name         = "A2BVersioning"
    cs.version      = "1.0.3"
    cs.dependency 'A2BVersioning', '1.0.3'
    cs.frameworks = 'A2BVersioning'
  end

  spec.subspec 'A2BCore' do |cs|
    cs.name         = "A2BCore"
    cs.version      = "1.0.5"
    cs.dependency 'A2BCore', '1.0.5'
    cs.frameworks = 'A2BCore'
  end

end
