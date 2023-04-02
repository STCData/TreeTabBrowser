//
//  WebTab.swift
//  DataCollector
//
//  Created by standard on 3/9/23.
//

import Foundation
import SwiftUI

class WebTab: Identifiable, ObservableObject {
    @Published
    var faviconImage: WKImage? = nil

    @Published
    var title: String? = nil

    @Published
    var children: [WebTab]? = nil

    @Published
    var faviconColorTint: Color? = [
        .blue,
        Color(.brown),
        .green,
        .red,
        .pink,
    ].randomElement()!

    let id = UUID()

    var timestamp = Date()

    let urlRequest: URLRequest

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
