//
//  WebView+FavIcon.swift
//  DataCollector
//
//  Created by standard on 3/19/23.
//

import FaviconFinder

import Foundation
import Logging
private let log = MakeLogger()

extension WebTab {
    func loadFavIcon() async {
        guard let url = urlRequest.url else { return }

        let favFinder = FaviconFinder(url: url)
        favFinder.downloadFavicon { result in
            switch result {
            case let .success(favicon):
                DispatchQueue.main.async {
                    self.faviconColorTint = nil
                    self.faviconImage = favicon.image
                }

                log.info("URL of Favicon: \(favicon.url)")
                NotificationCenter.default.post(name: .WebViewDetailsLoaded, object: nil, userInfo: [
                    WebViewLoadedUserInfoWebTab: self, // fixme
                    WebViewLoadedUserInfoWebFaviconImage: favicon.image,
                ])
            case let .failure(error):
                log.error("Error: \(error)")
            }
        }
    }
}
