Pod::Spec.new do |s|

# 1
s.platform = :ios, '9.0'
s.ios.deployment_target = '9.0'
s.name = "AppFriendsUI"
s.summary = "UI components for AppFriends."
s.requires_arc = true

# 2
s.version = "2.0.3"

# 3
s.license = { :type => "MIT" }

# 4 - author
s.author = { "Hao Wang" => "hao.wang@hacknocraft.com" }

# 5 - home page
s.homepage = "http://appfriends.me"

# 6 - framework location
s.vendored_frameworks = "AppFriendsUI.framework"
s.source = { :git => "https://github.com/Hacknocraft/AppFriendsUI.git", :tag => s.version.to_s}

# 7
s.dependency 'SlackTextViewController', '~> 1.9.5'
s.dependency 'JGProgressHUD', '~> 1.4'
s.dependency 'AppFriendsCore', '~> 2.0.1'
s.dependency 'AFDateHelper', '~> 3.5.3'
s.dependency 'AlamofireImage', '~> 3.1'

end
