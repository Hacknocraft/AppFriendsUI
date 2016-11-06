Pod::Spec.new do |s|

# 1
s.platform = :ios, '9.0'
s.ios.deployment_target = '9.0'
s.name = "AppFriendsUI"
s.summary = "UI components for AppFriends."
s.requires_arc = true

# 2
s.version = "1.0.63.swift2.3"

# 3
s.license = { :type => "MIT" }

# 4 - author
s.author = { "Hao Wang" => "hao.wang@hacknocraft.com" }

# 5 - home page
s.homepage = "http://appfriends.me"

# 6 - framework location
s.vendored_frameworks = "AppFriendsUI.framework"
s.source = { :git => "https://github.com/laeroah/AppFriendsCoreFramework.git", :tag => "0.1.53.swift2.3"}

# 7
s.dependency 'SlackTextViewController', '~> 1.9.5'
s.dependency 'NSDate+TimeAgo', '~> 1.0.6'
s.dependency 'CLTokenInputView', '~> 2.3.0'
s.dependency 'JGProgressHUD', '~> 1.4'
s.dependency 'SESlideTableViewCell', '~> 0.7.1'
s.dependency 'DZNEmptyDataSet', '~> 1.8.1'
s.dependency 'AppFriendsCore'
s.dependency 'AFDateHelper'
s.dependency 'AlamofireImage', '~> 2.5'
s.dependency 'EZSwiftExtensions', '1.5'

end
