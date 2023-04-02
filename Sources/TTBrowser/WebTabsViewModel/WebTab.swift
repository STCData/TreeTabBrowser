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
}
