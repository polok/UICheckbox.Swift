Pod::Spec.new do |s|
  s.name             = 'UICheckbox.Swift'
  s.version          = '1.0.0'
  s.summary          = 'UICheckbox.Swift is simple as hell and lightweight class to add \'checkbox\' UI component in iOS application.'
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
