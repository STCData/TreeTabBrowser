//
//  SceneDelegate+iOS.swift
//  TreeTabBrowser
//
//  Created by standard on 4/2/23.
//

import Foundation
#if os(iOS) || os(watchOS) || os(tvOS)

    import SwiftUI
    import UIKit

    class SceneDelegate: UIResponder, UIWindowSceneDelegate {
        var window: UIWindow?

        func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
            let contentView = ContentView()

            if let windowScene = scene as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                window.rootViewController = UIHostingController(rootView: contentView)
                self.window = window
                window.makeKeyAndVisible()
            }
        }
    }

#endif
