Pod::Spec.new do |s|
  s.name             = 'ParallaxHeaderView'
  s.version          = '0.1.0'
  s.summary          = 'This simple Parallax Header View.'
  s.description      =  <<-DESC
                        This simple Parallax Header View implementation.
                        DESC
  s.homepage         = 'https://github.com/alfian0/ParallaxHeader'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alfiansyah' => 'alfian.official.mail@gmail.com' }
  s.source           = { :git => 'https://github.com/alfian0/ParallaxHeader.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'ParallaxHeaderView/Base/*.swift'
 
end