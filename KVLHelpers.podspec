#
# Be sure to run `pod lib lint KVLHelpers.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "KVLHelpers"
  s.version          = "0.1.7"
  s.summary          = "A usefull set of extensions and classes"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
s.description      = <<-DESC
KVLhelpers library is a set of useful extensions to popular classes and other utility classes.
                       DESC

  s.homepage         = "https://github.com/smogun/KVLHelpers"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Misha" => "mikoval@gmail.com" }
  s.source           = { :git => "https://github.com/smogun/KVLHelpers.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.source_files = 'KVLHelpers/KVLHelpers/**/*'


#s.resource_bundles = {
#    'KVLHelpers' => ['Pod/Assets/*.png']
#  }

  # s.public_header_files = 'KVLHelpers/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
