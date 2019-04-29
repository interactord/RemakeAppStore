platform :ios, '12.2'

# ServiceKit
def service_kit
  pod 'ServiceKitLogger', '~1.0.1'
end

target 'RemakeAppStore' do

  use_frameworks!

  inhibit_all_warnings!

  pod 'SwiftLint'
  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'
  pod 'RxFlow'
  pod 'SwiftyBeaver'
  pod 'Swinject', '~> 2.6.0'
  pod 'SwiftyBeaver'

  service_kit

  target 'RemakeAppStoreTests' do
    inherit! :search_paths

    inhibit_all_warnings!

    pod 'SwiftLint'
    pod 'RxBlocking', '~> 4.0'
    pod 'RxTest', '~> 4.0'

  end

end
