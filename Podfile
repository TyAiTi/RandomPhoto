platform :ios, '11.0'

workspace 'RandomSDK'

target 'RandomPhoto' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for RandomPhoto

end


pod 'SDK', :path => '/Users/phamphilong/Desktop/githubTy/Halome-SDK-Andoird/releases/ios/1.0.0'


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
end