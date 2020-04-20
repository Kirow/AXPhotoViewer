Pod::Spec.new do |s|
  s.name            = "AXPhotoViewer"
  s.version         = "1.7.1-discogs.1"
  s.license         = { :type  => 'MIT', :file => 'LICENSE.md' }
  s.summary         = "An iOS/tvOS photo gallery viewer, useful for viewing a large number of photos."
  s.homepage        = "https://github.com/alexhillc/AXPhotoViewer"
  s.author          = { "Alex Hill" => "alexhill.c@gmail.com" }
  s.source          = { :git => "https://github.com/discogs/AXPhotoViewer.git", :tag => "v#{s.version}" }

  s.requires_arc    = true
  s.swift_versions = '5.0'
  s.ios.deployment_target = '10.0'
  s.tvos.deployment_target = '10.10'

  s.default_subspec = 'Core'

  s.subspec 'Core' do |cs|
    cs.ios.dependency  'AXStateButton', '~> 1.1'
    cs.ios.dependency  'FLAnimatedImage', '~> 1.0'
    cs.tvos.dependency 'FLAnimatedImage-tvOS', '~> 1.0.16'
    cs.resources     = 'Assets/*.{xcassets}'
    cs.source_files  = 'Source/*.{swift,h,m}',
                       'Source/Classes/**/*.{swift,h,m}',
                       'Source/Protocols/*.{swift,h,m}',
                       'Source/Extensions/*.{swift,h,m}',
                       'Source/Utilities/*.{swift,h,m}',
                       'Source/Integrations/SimpleNetworkIntegration.swift'
    cs.frameworks    = 'MobileCoreServices', 'ImageIO', 'UIKit', 'QuartzCore'
  end

  s.subspec 'SDWebImage' do |ss|
    ss.ios.deployment_target = '10.0'
    ss.tvos.deployment_target = '10.10'
    ss.dependency      'AXPhotoViewer/Core'
    ss.dependency      'SDWebImage', '~> 4.0'
    ss.source_files  = 'Source/Integrations/SDWebImageIntegration.swift'
  end

  s.subspec 'PINRemoteImage' do |ps|
    ps.ios.deployment_target = '10.0'
    ps.tvos.deployment_target = '10.10'
    ps.dependency      'AXPhotoViewer/Core'
    ps.dependency      'PINRemoteImage', '3.0.0-beta.9'
    ps.source_files  = 'Source/Integrations/PINRemoteImageIntegration.swift'
  end

  s.subspec 'AFNetworking' do |as|
    as.ios.deployment_target = '10.0'
    as.tvos.deployment_target = '10.10'
    as.dependency      'AXPhotoViewer/Core'
    as.dependency      'AFNetworking/NSURLSession', '~> 4.0'
    as.source_files  = 'Source/Integrations/AFNetworkingIntegration.swift'
  end

  s.subspec 'Kingfisher' do |ks|
    ks.ios.deployment_target = '10.0'
    ks.tvos.deployment_target = '10.10'
    ks.dependency      'AXPhotoViewer/Core'
    ks.dependency      'Kingfisher', '~> 5.13'
    ks.source_files  = 'Source/Integrations/KingfisherIntegration.swift'
  end

  s.subspec 'Nuke' do |nk|
    nk.ios.deployment_target = '10.0'
    nk.tvos.deployment_target = '10.10'
    nk.dependency      'AXPhotoViewer/Core'
    nk.dependency      'Nuke', '~> 8.4'
    nk.source_files  = 'Source/Integrations/NukeIntegration.swift'
  end
end
