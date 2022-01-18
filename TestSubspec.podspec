#
# Be sure to run `pod lib lint TestSubspec.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TestSubspec'
  s.version          = '1.0.7'
  s.summary          = 'Core component of linksdk'

  s.description      = <<-DESC
Description of Core component of linksdk
                   DESC

  s.homepage         = 'https://github.com/mbogdanovicz/TestSubspec'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mbogdanovicz' => 'aub_mbogdanovicz@a-to-be.com' }
  s.source           = { :git => 'https://github.com/mbogdanovicz/TestSubspec.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'TestSubspec/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TestSubspec' => ['TestSubspec/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.swift_version = "5.0"
end
