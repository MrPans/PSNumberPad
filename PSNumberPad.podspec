Pod::Spec.new do |s|

  s.name         = "PSNumberPad"
  s.version      = "1.2.0"
  s.summary      = "A number keyboard for input price."
  s.description  = <<-DESC
                   A number keyboard for input price.
                   Apple have many keyboard but no one compeletly suitable the scene,which is price input.
                   PSNumberPad fill this blank.
                   DESC
  s.homepage     = "https://github.com/DeveloperPans/PSNumberPad"
  s.screenshots  = "https://raw.githubusercontent.com/DeveloperPans/PSNumberPad/master/PSNumberPad.gif"
  s.license      = "MIT"
  s.author             = { "Pan" => "developerpans@163.com" }
  s.social_media_url = 'http://shengpan.net'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source       = { :git => "https://github.com/DeveloperPans/PSNumberPad.git", :tag => s.version.to_s }
  s.source_files = 'PSNumberPad/**/*.{h,m}'
  s.resource = 'PSNumberPad/**/*.{xib,png}'
  s.resource_bundle = { 'PSNumberPadIcons' => 'PSNumberPad/icons/*.png' }
end
