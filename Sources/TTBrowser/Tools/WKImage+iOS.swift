//
//  WKImage+iOS.swift
//
//
//  Created by standard on 4/2/23.
//

import SwiftUI

#if os(iOS) || os(watchOS) || os(tvOS)
    import UIKit
    typealias WKImage = UIImage

    extension Image {
        init(wkImage: WKImage) {
            self.init(uiImage: wkImage)
        }
    }

    typealias WKColor = UIColor

    extension Color {
        init(wkColor: WKColor) {
            self.init(wkColor)
        }
    }

#endif
