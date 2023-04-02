//
//  WebTab.swift
//  DataCollector
//
//  Created by standard on 3/9/23.
//

import Foundation
import SwiftUI

#if os(iOS) || os(watchOS) || os(tvOS)
    import UIKit
    typealias WKImage = UIImage

extension Image {
    init(wkImage: WKImage) {
        self.init(uiImage:wkImage)
    }
}


typealias WKColor = UIColor

extension Color {
init(wkColor: WKColor) {
    self.init(wkColor)
}
}


#elseif os(macOS)
    import AppKit
    typealias WKImage = NSImage

extension Image {
    init(wkImage: WKImage) {
        self.init(nsImage:wkImage)
    }
}

typealias WKColor = NSColor

extension Color {
init(wkColor: WKColor) {
    self.init(nsColor:wkColor)
}
}

#endif

class WebTab: Hashable, Identifiable, ObservableObject, CustomStringConvertible {
    var description: String {
        return (title ?? urlRequest.url?.absoluteString) ?? "n/a"
    }

    var id = UUID()
    
    var timestamp = Date()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: WebTab, rhs: WebTab) -> Bool {
        lhs.id == rhs.id
    }

    init(urlRequest: URLRequest) {
        self.urlRequest = urlRequest
        setDefaultFavIcon()
    }

    init(title: String, url: URL, children: [WebTab]? = nil) {
        self.title = title
        urlRequest = URLRequest(url: url)
        self.children = children
        setDefaultFavIcon()
    }

    @Published
    var title: String? = nil

    @Published
    var faviconColorTint: Color? = [
        .blue,
        Color(.brown),
        .green,
        .red,
        .pink,
    ].randomElement()!

    @Published
    var faviconImage: WKImage? = nil

    let urlRequest: URLRequest

    @Published
    var children: [WebTab]? = nil

    func addChild(_ child: WebTab) {
        var newChildren = children ?? []
        newChildren.append(child)
        children = newChildren
    }

    func updateChild(_ child: WebTab, with newChild: WebTab) {
        if let i = children?.firstIndex(of: child) {
            children?[i] = newChild
        }
    }
}

extension WebTab {
    func findParent(for child: WebTab) -> WebTab? {
        var stack = [self]
        while !stack.isEmpty {
            let current = stack.removeLast()
            if let children = current.children {
                if children.contains(child) {
                    return current
                }
            }

            if let children = current.children {
                stack.append(contentsOf: children)
            }
        }
        return nil
    }
}




