# Opening links in Firefox for iOS #
This open source project provides support for opening links in Firefox for iOS. There are classes (for Objective-C and Swift), along with a sample project that uses them, available for refrence and use. 

### Using OpenInFirefoxControllerSwift or OpenInFirefoxControllerObjC to open links ###
The `OpenInFirefoxControllerSwift` and `OpenInFirefoxContollerObjC` classes provide methods that handle the making of custom URI schemes, checking if Firefox is installed on the device and opening the URL in Firefox. Callback URL support in the browser UI will be provided in the near future. We have provided Swift and Objective-C implementations of these classes to accommodate to your language of choice.

### Methods ###
* `isFirefoxInstalled`: returns true if Firefox is installed
* `openInFirefox`: opens the specified URL in Firefox; used with or without the following
 * `callbackScheme`: the URL to which a callback is sent; you can define your app's custom URI scheme in a class variable called `myAppScheme` at the top of both class files.

### Callback to App Support ###
Currently, callbacks aren't supported in the Firefox browser yet. In the future, if you include a custom app URI scheme for the callback to be sent to when you open links in Firefox, the browser will have a back button in the UI such that when tapped, it will take the user back to the your app.

