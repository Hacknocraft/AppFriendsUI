# Change login
## version 1.2.0 - Jan 19, 2017
1. Better public channel chat support.
2. Support delivery of messages to multiple devices. eg. If you log in to iPhone, then put the phone to background and start using iPad, the messages will be pushed to your iPad. We *do not* support using two devices using the same account at the same time at this point.
3. Added public API to dialogs. For each dialog object, you can use `isMuted()` and `unreadMessageCount()`
4. Added public API to set default message types support for the chat: `HCSettingsConfiguation.supportedMessageTypes`
