Pod::Spec.new do |spec|

  spec.name         = "A2BCore"
  spec.version      = "1.0.7"
  spec.summary      = "Core component of linksdk"

  spec.description  = <<-DESC
Core component of linksdk
                   DESC

  spec.homepage     = "https://www.a-to-be.com"

  spec.license      = { :type => 'BSD' }

  spec.author       = { "Marcelo Bogdanovicz" => "aub_mbogdanovicz@a-to-be.com" }

  spec.platform     = :ios, "12.3"

  spec.source       = { :git => 'https://github.com/MBogdanovicz/TestSubspec.git' }

  # spec.subspec "Subspec" do |spec|
  #   spec.source_files   = "subspec/Subspec/**/*.{h,m,swift}"
  #   spec.public_header_files = "subspec/Subspec/*.{h}"
  #   spec.header_dir = "subspec"
  # end

  spec.source_files  = "core/A2BCore/**/*.{h,m,swift}"
  spec.ios.deployment_target = '12.3'

  spec.swift_version = "5.0"

end