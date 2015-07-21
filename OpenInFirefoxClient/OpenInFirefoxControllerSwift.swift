/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import UIKit

public class OpenInFirefoxControllerSwift {
    let firefoxScheme = "firefox:"
    let basicURL = NSURL(string: "firefox://")!

    // Input your custom URI scheme to provide callback to your app.
    let myAppScheme = "firefoxopeninfirefoxclient://"

    // This would need to be changed if used from an extension… but you
    // can't open arbitrary URLs from an extension anyway.
    let app = UIApplication.sharedApplication()

    private func encodeByAddingPercentEscapes(input: NSString) -> NSString {
        return CFURLCreateStringByAddingPercentEscapes(
            kCFAllocatorDefault,
            input as CFStringRef,
            nil,
            "!*'();:@&=+$,/?%#[]" as CFStringRef,
            kCFStringEncodingASCII)
    }

    public func isFirefoxInstalled() -> Bool {
        return app.canOpenURL(basicURL)
    }

    public func openInFirefox(url: NSURL) ->  Bool {
        let myAppScheme = NSURL(string: self.myAppScheme)
        return openInFirefox(url, callbackScheme: myAppScheme)
    }

    public func openInFirefox(url: NSURL, callbackScheme: NSURL?) -> Bool {
        if !app.canOpenURL(basicURL) {
            return false
        }

        let scheme = url.scheme
        if scheme == "http" || scheme == "https" {
            let firefoxURLString: NSMutableString
            if let callback = callbackScheme,
                   appName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleDisplayName") as? NSString {
                firefoxURLString = NSMutableString(format: "%@//x-callback-url/open/?x-source=%@&url=%@&x-source-name=%@", firefoxScheme, callback, encodeByAddingPercentEscapes(url.absoluteString!), encodeByAddingPercentEscapes(appName))
            } else {
                firefoxURLString = NSMutableString(format: "%@//open-url?url=%@", firefoxScheme, encodeByAddingPercentEscapes(url.absoluteString!))
            }

            let allowed = NSCharacterSet.URLQueryAllowedCharacterSet()
            if let encoded = firefoxURLString.stringByAddingPercentEncodingWithAllowedCharacters(allowed),
                   firefoxURL = NSURL(string: encoded as String) {
                return app.openURL(firefoxURL)
            }
        }

        return false
    }
}
