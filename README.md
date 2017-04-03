# Quick Start
## 1. Create an AppFriends Application
Before start using AppFriends, you need to create an application on the [dashboard](http://appfriends.hacknocraft.com/landing/index) Users in the same application can talk to each other and you only need one application for all the platforms you want to support.

## 2. Integrate AppFriends SDK
### Using Cocoapods
To integrate AppFriends iOS SDK to your Xcode iOS project, add this line in your `Podfile`
``` ruby
pod 'AppFriendsUI', '~> 2.0.1'
pod 'AppFriendsCore', '~> 2.0.1'
```
Also, add `use_frameworks!` to the top of file. eg.
``` ruby
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Hacknocraft/hacknocraft-cocoapods-spec.git'
use_frameworks!
...
```

You might need to run `pod repo update` after this step before calling `pod install`

To see an sample app of how to use AppFriendsUI, please checkout our repo:

<a href="https://github.com/Hacknocraft/AppFriendsiOSSample">
<button class="btn btn-info">Github iOS Sample App</button>  
</a>

If you don't want any of the UI components we provide, you can directly interact with the platform API, and we have a core framework to use for that purpose:
``` ruby
pod 'AppFriendsCore', '~> 2.0.1'
```

## 3. Import Header
The next step is import the headers.

### Example

#### Swift
``` swift
#import AppFriendsCore
#import AppFriendsUI
```

#### Objective-C
```Objective-C
#import <AppFriendsCore/AppFriendsCore-Swift.h>
#import <AppFriendsUI/AppFriendsUI-Swift.h>
```
## 4. Initialization
Now, we can use the AppFriends key and secret to initialize the SDK. Key and secret can be found in your AppFriends dashboard. If you are using the `AppFriendsUI` SDK, you can initialize by:

### AppFriendsUI Initialization

#### Swift
```swift
AppFriendsUI.sharedInstance.initialize("[appfriends key]", secret: "[appfriends secret]") { (success, error) in
		if !success {
				NSLog("AppFriends initialization error:\(error?.localizedDescription)")
		}else {
			 // initialization is successful
		}
}
```

#### Objective-C
```Objective-C
import AppFriendsCore
import AppFriendsUI
```

### AppFriendsCore Initialization

**Skip** this step if you are using the `AppFriendsUI` SDK. If you are using `AppFriendsCore` SDK, you can initialize by:

#### Swift
```swift
HCSDKCore.sharedInstance.initialize(key: "[appfriends key]", secret: "[appfriends secret]") { (success, error) in
		if !success {
				NSLog("AppFriends initialization error:\(error?.localizedDescription)")
		}else {
			 // initialization is successful
		}
}
```

#### Objective-C
```Objective-C
import AppFriendsCore
import AppFriendsUI
```
## 5. Login
After initialization, you want to login your user to AppFriends, so he can start chatting with other users. Please see [sessions](sessions.md) for detail
