# Opening links in Firefox for iOS #
This open-source project provides support for opening links in Firefox for iOS. There are classes (for Objective-C and Swift), along with a sample project that uses them, available for reference and use. 

### Using OpenInFirefoxControllerSwift or OpenInFirefoxControllerObjC to open links ###
The `OpenInFirefoxControllerSwift` and `OpenInFirefoxControllerObjC` classes provide methods that handle the making of custom URI schemes, checking if Firefox is installed on the device and opening the URL in Firefox. We have provided Swift and Objective-C implementations of these classes to accommodate your language of choice.

### Methods ###
* `isFirefoxInstalled`: returns true if Firefox is installed
* `openInFirefox`: opens the specified URL in Firefox; used with or without the following:

### The Custom Firefox URL ###
Firefox uses a single URI scheme, `firefox://`. This scheme can accepts the following query parameter:
* `url`: (required) the URL to open in Firefox.

For Example: 
```
firefox://open-url?url=https%253A%252F%252Fwww.mozilla.org%252Fen-US%252Fnewsletter%252Fios%252F
```
### Walkthrough ###
1. Download the class file in the language of your choice:
  * Swift: [OpenInFirefoxControllerSwift.swift](https://github.com/mozilla/firefox-ios-open-in-client/blob/master/OpenInFirefoxClient/OpenInFirefoxControllerSwift.swift)
  * Objective-C: [OpenInFirefoxControllerObjC.m](https://github.com/mozilla/firefox-ios-open-in-client/blob/master/OpenInFirefoxClient/OpenInFirefoxControllerObjC.m), [OpenInFirefoxControllerObjC.h](https://github.com/mozilla/firefox-ios-open-in-client/blob/master/OpenInFirefoxClient/OpenInFirefoxControllerObjC.h)
2. Whitelist the Firefox URL scheme in Info.plist, under the LSApplicationQueriesSchemes key:
  * In depth example on how to do that [here](http://useyourloaf.com/blog/querying-url-schemes-with-canopenurl.html)
  * If LSApplicationQueriesSchemes isn't already in your app's Info.plist, you can just manually add it
  * Add `firefox` to LSApplicationQueriesSchemes
3. Call methods to open links in Firefox:
  * [Example in Swift](https://github.com/mozilla/firefox-ios-open-in-client/blob/master/OpenInFirefoxClient/ViewController.swift#L38-41)

### Contribute to Firefox for iOS ###
Learn more about how to contribute to this project: [Firefox for iOS official repo](https://github.com/mozilla/firefox-ios)
