/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import UIKit
import WebKit

class ViewController: UIViewController {
    let url = URL(string: "https://www.mozilla.org/en-US/firefox/ios/")!

    override func viewDidLoad() {
        super.viewDidLoad()
        let myWebView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))

        let swiftButton = UIButton(type: UIButtonType.system)
        swiftButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        swiftButton.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 150)
        swiftButton.backgroundColor = UIColor.orange
        swiftButton.setTitle("OpenInFirefox with Swift", for: UIControlState())
        swiftButton.tintColor = UIColor.white
        swiftButton.addTarget(self, action: #selector(ViewController.buttonActionSwift(_:)), for: UIControlEvents.touchUpInside)

        let objCButton = UIButton(type: UIButtonType.system)
        objCButton.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        objCButton.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        objCButton.backgroundColor = UIColor.blue
        objCButton.setTitle("OpenInFirefox with Obj-C", for: UIControlState())
        objCButton.tintColor = UIColor.white
        objCButton.addTarget(self, action: #selector(ViewController.buttonActionObjC(_:)), for: UIControlEvents.touchUpInside)

        self.view.addSubview(myWebView)
        self.view.addSubview(swiftButton)
        self.view.addSubview(objCButton)
    }

    func buttonActionSwift(_ sender: UIButton!) {
        let controller = OpenInFirefoxControllerSwift()
        if controller.isFirefoxInstalled() {
            controller.openInFirefox(url)
        }
    }

    func buttonActionObjC(_ sender: UIButton!) {
        let controller = OpenInFirefoxControllerObjC()
        if controller.isFirefoxInstalled() {
            controller.open(inFirefox: url)
        }
    }
}
