#
# Be sure to run `pod lib lint Reactored.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name             = 'Reactored'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Reactored.'
  s.ios.deployment_target = '9.0'

  s.description      = <<-DESC
Reactored iOS
                       DESC

  s.frameworks = 'UIKit'
  s.dependency 'RxSwift'

  s.homepage         = 'https://github.com/loup-studio/Reactored-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Lukasz' => 'lukasz@intheloup.io' }
  s.source           = { :git => 'https://github.com/loup-studio/Reactored-iOS.git', :tag => s.version.to_s }

  s.source_files = 'Reactored/Classes/**/*'

end
