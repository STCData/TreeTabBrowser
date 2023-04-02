//
//  BrowserView+iOS.swift
//
//
//  Created by standard on 4/2/23.
//

import Foundation

#if os(iOS) || os(watchOS) || os(tvOS)
    import UIKit

    extension BrowserView {
        static var sidebarOpenedWidth: Double {
            UIScreen.main.bounds.size.width * 0.99
        }

        static var sidebarOpenedWebviewPaddingLeading: Double = 0.0

        static var sidebarOpenedBlur: Double = 13.0
    }
#endif
