//
//  WKImage+OSX.swift
//
//
//  Created by standard on 4/2/23.
//
import SwiftUI

#if os(macOS)
    import AppKit
    typealias WKImage = NSImage

    extension Image {
        init(wkImage: WKImage) {
            self.init(nsImage: wkImage)
        }
    }

    typealias WKColor = NSColor

    extension Color {
        init(wkColor: WKColor) {
            self.init(nsColor: wkColor)
        }
    }

    extension WKImage {
        convenience init?(systemName: String) {
            self.init(systemSymbolName: systemName, accessibilityDescription: systemName)
        }
    }
#endif
