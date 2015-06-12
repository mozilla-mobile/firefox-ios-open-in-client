/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#import <UIKit/UIKit.h>
#import "OpenInFirefoxControllerObjC.h"

static NSString *const firefoxScheme = @"firefox:";
static NSString *const myAppScheme = @"firefoxopeninfirefoxclient://";

@implementation OpenInFirefoxControllerObjC

// Creates a shared instance of the controller.
+ (OpenInFirefoxControllerObjC *)sharedInstance {
  static OpenInFirefoxControllerObjC *sharedInstance;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[self alloc] init];
  });
  return sharedInstance;
}

// Custom function that does complete percent escape for constructing the URL.
static NSString *encodeByAddingPercentEscapes(NSString *string) {
  NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
    kCFAllocatorDefault,
    (CFStringRef)string,
    NULL,
    (CFStringRef)@"!*'();:@&=+$,/?%#[]",
    kCFStringEncodingUTF8));
  return encodedString;
}

// Checks if Firefox is installed.
- (BOOL)isFirefoxInstalled {
  NSURL *url = [NSURL URLWithString:firefoxScheme];
  return  [[UIApplication sharedApplication] canOpenURL:url];
}

// Opens the URL in Firefox.
- (BOOL)openInFirefox:(NSURL *)url {
  NSURL *myAppSchemeURL = [NSURL URLWithString:myAppScheme];
  return [self openInFirefox:url callbackScheme:myAppSchemeURL];
}

- (BOOL)openInFirefox:(NSURL *)url
callbackScheme:(NSURL *)myAppScheme {
  NSURL *simpleFirefoxURL = [NSURL URLWithString:firefoxScheme];
  if ([[UIApplication sharedApplication] canOpenURL:simpleFirefoxURL]) {
    NSString *scheme = [url.scheme lowercaseString];
    if ([scheme isEqualToString:@"http"] || [scheme isEqualToString:@"https"]) {
      NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
      if (myAppScheme && appName) {
        NSString *urlString = [url absoluteString];
        NSMutableString *firefoxURLWithCallbackString = [NSMutableString string];
        [firefoxURLWithCallbackString appendFormat:@"%@//x-callback-url/open/?x-source=%@&url=%@&x-source-name=%@", firefoxScheme, myAppScheme, encodeByAddingPercentEscapes(urlString), encodeByAddingPercentEscapes(appName)];
        NSURL *firefoxURL = [NSURL URLWithString:[firefoxURLWithCallbackString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];

        // Open the URL with Firefox and callback button.
        return [[UIApplication sharedApplication] openURL:firefoxURL];
      } else {
        NSString *urlString = [url absoluteString];
        NSMutableString *firefoxURLString = [NSMutableString string];
        [firefoxURLString appendFormat:@"%@//open-url?url=%@", firefoxScheme, encodeByAddingPercentEscapes(urlString)];
        NSURL *firefoxURL = [NSURL URLWithString:[firefoxURLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];

        // Open the URL with Firefox.
        return [[UIApplication sharedApplication] openURL:firefoxURL];
      }
    }
  }
  return NO;
}

@end
