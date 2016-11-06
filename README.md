
# Quick Start
## 1. Create an AppFriends Application
Before start using AppFriends, you need to create an application on the [dashboard](http://appfriends.hacknocraft.com/landing/index) Users in the same application can talk to each other and you only need one application for all the platforms you want to support.

## 2. Integrate AppFriends SDK
### Using Cocoapods
To integrate AppFriends iOS SDK to your Xcode iOS project, add this line in your `Podfile`

    pod 'AppFriendsUI'

Also, add `use_frameworks!` to the file. eg.

    platform :ios, "8.0"
    use_frameworks!
    ...

To see an sample app of how to use AppFriendsUI, please checkout our repo:

<button class="btn btn-info">Github Sample App Repo</button>  

If you don't want any of the UI components we provide, you can directly interact with the platform API, and we have a core framework to use for that purpose:

    pod 'AppFriendsCore'

## 3. Import Header
The next step is import the headers.

### Example

#### Swift
<pre><code class="swift">import AppFriendsCore
import AppFriendsUI
</code></pre>

#### Objective-C
```
#import <AppFriendsCore/AppFriendsCore-Swift.h>
#import <AppFriendsUI/AppFriendsUI-Swift.h>
```
## 4. Initialization
Now, we can use the AppFriends key and secret to initialize the SDK. Key and secret can be found in your AppFriends dashboard. If you are using the `AppFriendsUI` SDK, you can initialize by:

### AppFriendsUI Initialization

#### Swift
<pre><code class="swift">
AppFriendsUI.sharedInstance.initialize("[appfriends key]", secret: "[appfriends secret]") { (success, error) in
        if !success {
                NSLog("AppFriends initialization error:\(error?.localizedDescription)")
        }else {
        }
}
</code></pre>

#### Objective-C
<pre><code class="swift">import AppFriendsCore
import AppFriendsUI
</code></pre>

### AppFriendsCore Initialization

**Skip** this step if you are using the `AppFriendsUI` SDK. If you are using `AppFriendsCore` SDK, you can initialize by:

#### Swift
<pre><code class="swift">
AppFriendsUI.sharedInstance.initialize("[appfriends key]", secret: "[appfriends secret]") { (success, error) in
        if !success {
                NSLog("AppFriends initialization error:\(error?.localizedDescription)")
        }else {
        }
}
</code></pre>

#### Objective-C
<pre><code class="swift">import AppFriendsCore
import AppFriendsUI
</code></pre>

# User Create and Login
AppFriends users are mirrors of the users in your app. To create or login a user on AppFriends, you need to provide at least

1. an unique username
2. an unique user ID

### Example
#### Swift
<pre><code class="swift">
let userInfo = [HCSDKConstants.kUserID: "e575be0fef6c24041a1749da54ece501", HCSDKConstants.kUserName: "John Doe"]
HCSDKCore.sharedInstance.loginWithUserInfo(userInfo)
{ (response, error) in
    if let err = error {
            // handle login error
    }
    else {
            // login is successful here
    }
}
</code></pre>

# Chat
## Dialogs
There are three types of dialogs:

1. Private one on one dialog. This is a conversation between two users. You can't add more users to private one on one dialog. This type of dialog is only visible to the two users.
2. Private group dialog. This is a conversation between multiple users. You can add up to 200 users to a private group chat. This type of dialog is only visible to users in the group.
3. Open channel dialog. This is an open conversation. It is visible to everyone. Each user can only be in one channel at a time.

### Mute a dialog


## Messages


# UI Components
AppFriendsUI provides a lot of useful and convenient UI components for you to use. It can save a lot of your time developing the app.  
