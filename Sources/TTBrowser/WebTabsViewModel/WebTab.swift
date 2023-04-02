//
//  WebTab.swift
//  DataCollector
//
//  Created by standard on 3/9/23.
//

import Foundation
import SwiftUI

public class WebTab: Identifiable, ObservableObject {
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

    public let id = UUID()

    var timestamp = Date()

    let urlRequest: URLRequest

    public init(urlRequest: URLRequest) {
        self.urlRequest = urlRequest
        setDefaultFavIcon()
    }

    public init(title: String, url: URL, children: [WebTab]? = nil) {
        self.title = title
        urlRequest = URLRequest(url: url)
        self.children = children
        setDefaultFavIcon()
    }
}
