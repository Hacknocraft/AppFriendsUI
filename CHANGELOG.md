# Change log
## version 2.0.1 - *April 4, 2017*
1. hide the CoreData classes and replace them with thread safe object classes
2. added data model and API classes `AFUser`, `AFSession`, `AFPushNotification`, `AFMessage`, `AFEvent`, `AFDialog` and `AFAttachment`
3. added location message type. Choose the message types you want to support by using `HCSettingsConfiguation.supportedMessageTypes`
4. added dialog album feature.
5. update the dependencies libraries versions

## version 1.2.15 - *Feb 15, 2017*
1. handle the issue that dialog title not loading if you enter chat from a push
2. full screen preview before image is sent to chat
3. other small UI updates
4. changed the SDK installation method. For detail, please see `http://appfriends.me/documentation/ios/quick_start/#2-integrate-appfriends-sdk`

## version 1.2.3 - *Jan 30, 2017*
1. fixed the issue with dialog name not updating if users in a dialog have left
2. added a notification when the user has left the dialog
3. added gif sending

## version 1.2.2 - *Jan 29, 2017*
1. make members in channel chat container view public
2. optimize online users banner

## version 1.2.1 - *Jan 23, 2017*
1. allow disabling dialogs from server side. disabled dialogs will disappear from the app.
2. fixed a bug with last message preview not updating in some corner cases.

## version 1.2.0 - *Jan 19, 2017*
1. Better public channel chat support.
2. Support delivery of messages to multiple devices. eg. If you log in to iPhone, then put the phone to background and start using iPad, the messages will be pushed to your iPad. We *do not* support using two devices using the same account at the same time at this point.
3. Added public API to dialogs. For each dialog object, you can use `isMuted()` and `unreadMessageCount()`
4. Added public API to set default message types support for the chat: `HCSettingsConfiguation.supportedMessageTypes`
