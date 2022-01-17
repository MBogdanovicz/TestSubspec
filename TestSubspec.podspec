Pod::Spec.new do |spec|

  spec.name         = "TestSubspec"
  spec.version      = "1.0.7"
  spec.summary      = "Core component of linksdk"

  spec.description  = <<-DESC
Description of Core component of linksdk
                   DESC

  spec.homepage     = "https://www.a-to-be.com"

  spec.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  LICENSE
}

  spec.author       = { "Marcelo Bogdanovicz" => "aub_mbogdanovicz@a-to-be.com" }

  spec.platform     = :ios, "12.3"

  spec.source       = { :git => 'https://github.com/MBogdanovicz/TestSubspec.git',
                        :tag => spec.version.to_s }

  # spec.subspec "Subspec" do |spec|
  #   spec.source_files   = "subspec/Subspec/**/*.{h,m,swift}"
  #   spec.public_header_files = "subspec/Subspec/*.{h}"
  #   spec.header_dir = "subspec"
  # end

  spec.source_files  = "core/A2BCore/**/*.{h,m,swift}"
  spec.public_header_files = "core/A2BCore/*.{h}"
  spec.header_dir = "core"
  spec.ios.deployment_target = '12.3'

  spec.swift_version = "5.0"

end