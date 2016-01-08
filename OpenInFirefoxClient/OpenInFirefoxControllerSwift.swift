/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import UIKit

public class OpenInFirefoxControllerSwift {
    let firefoxScheme = "firefox:"
    let basicURL = NSURL(string: "firefox://")!

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
        if !isFirefoxInstalled() {
            return false
        }

        let scheme = url.scheme
        if scheme == "http" || scheme == "https" {
            let firefoxURLString = NSMutableString(format: "%@//open-url?url=%@", firefoxScheme, encodeByAddingPercentEscapes(url.absoluteString))
            if let firefoxURL = NSURL(string: firefoxURLString as String) {
                return app.openURL(firefoxURL)
            }
        }
        return false
    }
}
