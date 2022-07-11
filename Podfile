platform :ios, '15.0'

install! 'cocoapods', :warn_for_unused_master_specs_repo => false

target 'alarm-ios' do
  use_frameworks!

  # Pods for alarm-ios
  pod 'Alamofire', '5.6.2'
  pod 'Kingfisher', '5.15.6'
  pod 'ProgressHUD', '13.7.2'
  
#  pod 'Firebase', '10.15.0'
#  pod 'FirebaseABTesting', '10.15.0'
#  pod 'FirebaseAuth', '10.15.0'
#  pod 'FirebaseInstallations', '10.15.0'
#  pod 'FirebaseRemoteConfig', '10.15.0'
#  pod 'GoogleUtilities', '7.11.5'
#  pod 'RecaptchaInterop', '100.0.0'
#  pod 'FirebaseAnalytics', '10.15.0'
#  pod 'FirebaseMessaging', '10.15.0'
#  pod 'FirebaseStorage', '10.15.0'
  
  #  pod 'Firebase/Firestore'
end

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end
