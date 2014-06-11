Pod::Spec.new do |s|
  s.name         = "GDStore"
  s.version      = "0.5.5"
  s.license      = { :type => 'Apache 2.0', :file => 'COPYING' }
  s.summary      = "Goodow Realtime provides collaborative objects, events, and methods for creating collaborative apps via the use of operational transforms."
  s.homepage     = "https://github.com/goodow/realtime"
  s.author       = { "Larry Tin" => "dev@goodow.com" }
  s.source       = { :git => "https://github.com/goodow/GDStore.git", :tag => "v#{s.version}" }

  s.requires_arc = true
  s.header_mappings_dir = 'Classes/generated'

  s.source_files = 'Classes/common', 'Classes/generated/**/*.{h,m}'
  s.dependency 'GDChannel', '~> 0.5'
end
