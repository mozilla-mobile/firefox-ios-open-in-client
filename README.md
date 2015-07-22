# Opening links in Firefox for iOS #
This open-source project provides support for opening links in Firefox for iOS. There are classes (for Objective-C and Swift), along with a sample project that uses them, available for reference and use. 

### Using OpenInFirefoxControllerSwift or OpenInFirefoxControllerObjC to open links ###
The `OpenInFirefoxControllerSwift` and `OpenInFirefoxControllerObjC` classes provide methods that handle the making of custom URI schemes, checking if Firefox is installed on the device and opening the URL in Firefox. Callback URL support in the browser UI will be provided in the near future. We have provided Swift and Objective-C implementations of these classes to accommodate your language of choice.

### Methods ###
* `isFirefoxInstalled`: returns true if Firefox is installed
* `openInFirefox`: opens the specified URL in Firefox; used with or without the following:
 * `callbackScheme`: the URL to which a callback is sent; you can define your app's custom URI scheme in a class variable called `myAppScheme` at the top of both class files.

### The Custom Firefox URL ###
Firefox uses a single URI scheme, `firefox://`. This scheme can accept the following query parameters:
* `url`: (required) the URL to open in Firefox.
* `x-source`: (optional) the app's custom URI scheme, specified in `myAppScheme`.
* `x-source-name`: (optional; required if `x-source` is specified) the app name to where the calling app returns; make sure to update your app's `CFBundleDisplayName` in its `Info.plist` file or specify a custom name in the class file.

For Example: 
* URL with `x-source` and `x-source-name` specified:
```
firefox://x-callback-url/open/?x-source=firefoxopeninfirefoxclient://&url=https%253A%252F%252Fwww.mozilla.org%252Fen-US%252Fnewsletter%252Fios%252F&x-source-name=OpenInFirefoxClient
```
* URL with only `url` specified:
```
firefox://open-url?url=https%253A%252F%252Fwww.mozilla.org%252Fen-US%252Fnewsletter%252Fios%252F
```
### Walkthrough ###
1. Download the class file in the language of your choice:
  * Swift: [OpenInFirefoxControllerSwift.swift](https://github.com/mozilla/firefox-ios-open-in-client/blob/master/OpenInFirefoxClient/OpenInFirefoxControllerSwift.swift)
  * Objective-C: [OpenInFirefoxControllerObjC.m](https://github.com/mozilla/firefox-ios-open-in-client/blob/master/OpenInFirefoxClient/OpenInFirefoxControllerObjC.m), [OpenInFirefoxControllerObjC.h](https://github.com/mozilla/firefox-ios-open-in-client/blob/master/OpenInFirefoxClient/OpenInFirefoxControllerObjC.h)
2. Update your app's custom URI scheme for callbacks:
  * Make sure to [register a custom URI scheme](http://iosdevelopertips.com/cocoa/launching-your-own-application-via-a-custom-url-scheme.html) for your app and update the `myAppScheme` variable ([Swift](https://github.com/mozilla/firefox-ios-open-in-client/blob/master/OpenInFirefoxClient/OpenInFirefoxControllerSwift.swift#L12-13), [Objective-C](https://github.com/mozilla/firefox-ios-open-in-client/blob/master/OpenInFirefoxClient/OpenInFirefoxControllerObjC.m#L9)) in the class file of your choice.
3. Call methods to open links in Firefox:
  * [Example in Swift](https://github.com/mozilla/firefox-ios-open-in-client/blob/master/OpenInFirefoxClient/ViewController.swift#L38-41)

### Contribute to Firefox for iOS ###
Learn more about how to contribute to this project: [Firefox for iOS official repo](https://github.com/mozilla/firefox-ios)
