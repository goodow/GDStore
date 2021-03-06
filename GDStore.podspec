Pod::Spec.new do |s|
  s.name         = "GDStore"
  s.version      = "0.5.5"
  s.license      = { :type => 'Apache 2.0', :file => 'COPYING' }
  s.summary      = "Goodow Realtime provides collaborative objects, events, and methods for creating collaborative apps via the use of operational transforms."
  s.homepage     = "https://github.com/goodow/realtime-store"
  s.author       = { "Larry Tin" => "dev@goodow.com" }
  s.source       = { :git => "https://github.com/goodow/GDStore.git", :tag => "v#{s.version}" }

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.requires_arc = true
  s.header_mappings_dir = 'Classes/generated'

  s.source_files = 'Classes/common', 'Classes/generated/**/*.{h,m}'
  s.dependency 'GDChannel', '~> 0.5'

  # Pods-GDStore target need the next line.
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/J2ObjC/dist/include"' }
end
