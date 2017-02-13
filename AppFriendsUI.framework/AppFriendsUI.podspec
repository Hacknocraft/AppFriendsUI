# this is the Podspec for development to install from local repo
Pod::Spec.new do |s|

# 1
s.platform = :ios, '9.0'
s.ios.deployment_target = '9.0'
s.name = "AppFriendsUI"
s.summary = "UI components for AppFriends."
s.requires_arc = true

# 2
s.version = "1.2.8"

# 3
s.license = { :type => "MIT" }

# 4 - author
s.author = { "Hao Wang" => "hao.wang@hacknocraft.com" }

# 5 - home page
s.homepage = "http://appfriends.me"

# 6 - framework location
s.source        = { :git => "https://github.com/Hacknocraft/AppFriendsUISource.git", :tag => s.version.to_s}
s.source_files 	= "Source/**/*.{swift,xib}"
s.resource	 	= "Source/AppFriendsResources.bundle"

# 7
s.dependency 'SlackTextViewController', '~> 1.9.5'
s.dependency 'CLTokenInputView', '~> 2.3.0'
s.dependency 'JGProgressHUD', '~> 1.4'
s.dependency 'SESlideTableViewCell', '~> 0.7.1'
s.dependency 'AppFriendsCore'
s.dependency 'AFDateHelper', '~> 3.5.3'
s.dependency 'AlamofireImage', '~> 3.1'
s.dependency 'EZSwiftExtensions', '~> 1.7'

end
