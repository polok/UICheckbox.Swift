#
# Be sure to run `pod lib lint UICheckbox.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UICheckbox'
  s.version          = '0.1.0'
  s.summary          = 'UICheckbox is simple as hell and lightweight class to add \'checkbox\' UI component in iOS application.'
  s.homepage         = 'https://github.com/polok/UICheckbox.Swift'
  s.screenshots      = 'https://raw.githubusercontent.com/polok/UICheckbox.Swift/master/Resources/uicheckbox_example.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'marcin.polak' => 'mpolak87@gmail.com' }
  s.source           = { :git => 'https://github.com/polok/UICheckbox.Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'UICheckbox/Classes/**/*'
  
  s.resource_bundles = {
     'UICheckbox' => ['UICheckbox/Assets/*.png']
  }

end
