//
//  TreeTabBrowserApp.swift
//  TreeTabBrowser
//
//  Created by standard on 4/2/23.
//

import SwiftUI

struct TreeTabBrowserApp: App {
    @available(iOS 14.0, *)
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// class MyApplication: UIApplication {
//    override func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil) {
//        if let host = url.host, host.contains("hackingwithswift.com") {
//            super.open(url, options: options, completionHandler: completion)
//        } else {
//            completion?(false)
//        }
//    }
// }

#if os(macOS)
    @main

    enum TreeTabBrowserAppAppWrapper {
        static func main() {
            if #available(iOS 14.0, *) {
                TreeTabBrowserApp.main()
            } else {
//            UIApplicationMain(
//                CommandLine.argc,
//                CommandLine.unsafeArgv,
//                NSStringFromClass(MyApplication.self),
//                NSStringFromClass(AppDelegate.self)
//            )
            }
        }
    }

#endif
