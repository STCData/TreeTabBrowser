//
//  WebTab+DefaultFavIcon.swift
//  DataCollector
//
//  Created by standard on 3/19/23.
//

import Foundation

private let sfDefaultFavicons = [
    "globe.americas.fill",
    "globe.europe.africa.fill",
    "globe.asia.australia.fill",
    "globe.central.south.asia.fill",
]

#if os(macOS)
    extension WKImage {
        convenience init?(systemName: String) {
            self.init(systemSymbolName: systemName, accessibilityDescription: systemName)
        }
    }
#endif
extension WebTab {
    func setDefaultFavIcon() {
        faviconImage = WKImage(systemName: sfDefaultFavicons.randomElement()!)
    }
}
