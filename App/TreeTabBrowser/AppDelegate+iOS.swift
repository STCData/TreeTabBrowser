//
//  AppDelegate+iOS.swift
//  TreeTabBrowser
//
//  Created by standard on 4/2/23.
//

import Foundation
import SwiftUI

#if os(iOS) || os(watchOS) || os(tvOS)

    import UIKit

    class AppDelegate: UIResponder, UIApplicationDelegate {
        var window: UIWindow?

        func application(
            _: UIApplication,
            didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
            return true
        }
    }

#endif
