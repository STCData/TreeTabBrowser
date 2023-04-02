//
//  BrowserView+OSX.swift
//
//
//  Created by standard on 4/2/23.
//

#if os(macOS)
    extension BrowserView {
        static var sidebarOpenedWidth: Double = 300.0

        static var sidebarOpenedWebviewPaddingLeading: Double {
            sidebarOpenedWidth
        }

        static var sidebarOpenedBlur: Double = 0.0
    }

#endif
