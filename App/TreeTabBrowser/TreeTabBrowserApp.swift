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

@main

enum TreeTabBrowserAppAppWrapper {
    static func main() {
        if #available(iOS 14.0, *) {
            TreeTabBrowserApp.main()
        } else {
            #if os(iOS) || os(watchOS) || os(tvOS)

                UIApplicationMain(
                    CommandLine.argc,
                    CommandLine.unsafeArgv,
                    nil,
                    NSStringFromClass(AppDelegate.self)
                )
            #endif
        }
    }
}
