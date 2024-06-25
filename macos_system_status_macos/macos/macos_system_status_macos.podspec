#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
	s.name             = 'macos_system_status_macos'
	s.version          = '1.0.1'
	s.summary          = 'An MacOS implementation of the macos_system_status plugin.'
	s.description      = <<-DESC
	MacOS System Status 
	An MacOS implementation of the macos_system_status plugin.
		 DESC
	s.homepage         = 'https://github.com/mrasityilmaz/MacOS-System-Status'
	s.license          = { :type => 'MIT', :file => 'macos_system_status_macos/LICENSE' }
	s.author           = { 'Muhammed Raşit Yılmaz' => 'yilmazrasitt@gmail.com' }
	
	s.source           = { :git => 'https://github.com/mrasityilmaz/MacOS-System-Status.git',
	                       :commit => "5e2facc5c8b0dea79cd1ed1b60757a38fcf39174" }
		   
                  s.source_files  = 'Classes/**/*.{h,m}'
	
	s.static_framework = true
                  
	
	s.dependency 'FlutterMacOS'
  
	s.platform = :osx, '10.14.6'
	s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
	s.swift_version = '5.0'
                  
	
	
                  end
                  