Pod::Spec.new do |s|
  s.name         = "GDRealtime"
  s.version      = "0.3.1"
  s.license      = { :type => 'Apache 2.0', :file => 'COPYING' }
  s.summary      = "Goodow Realtime provides collaborative objects, events, and methods for creating collaborative apps via the use of operational transforms."
  s.homepage     = "https://github.com/goodow/realtime"
  s.author       = { "Larry Tin" => "dev@goodow.com" }
  s.source       = { :git => "https://github.com/goodow/GDRealtime.git", :tag => "v#{s.version}" }

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.8'
  s.requires_arc = true
  s.default_subspec = 'default'
  # Target Pods-GDRealtime need this
  s.header_mappings_dir = 'Classes/generated/include'
  # s.resources = 'Resources/**'

  s.subspec 'default' do |d|
    d.ios.source_files = 'Classes/ios'
    d.dependency 'GDRealtime/common'
  end

  s.subspec 'common' do |common|
    common.source_files = 'Classes/common'
    common.dependency 'Google-Diff-Match-Patch', '~> 0.0.1'
    common.dependency 'GTMHTTPFetcher', '~> 0.0.1'
    common.dependency 'GDRealtime/generated'
  end

  s.subspec 'generated' do |gen|
    gen.source_files = 'Classes/generated/include/**/*.h'
    
    gen.subspec 'operation' do |operation|
      operation.source_files = 'Classes/generated/operation/**/*.m'
      operation.dependency 'GDJson', '~> 0.3.0'
      # Target Pods-GDRealtime need the next line.
      operation.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/J2ObjC/dist/include"' }
    end

    gen.subspec 'channel' do |channel|
      channel.source_files = 'Classes/generated/channel/**/*.m'
      channel.dependency 'GDRealtime/generated/operation'
    end

    gen.subspec 'api' do |api|
      api.source_files = 'Classes/generated/api/**/*.m'
      api.dependency 'GDRealtime/generated/channel'
    end

    gen.subspec 'services' do |services|
      services.source_files = 'Classes/generated/services/**/*.{h,m}'
      services.exclude_files = 'Classes/generated/services/**/*_Sources.m'
      services.dependency 'Google-API-Client/Common'
      services.dependency 'Google-API-Client/Objects'
      services.dependency 'Google-API-Client/Utilities'
    end
  end
end
