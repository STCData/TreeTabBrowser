//
//  WebView.swift
//  DataCollector
//
//  Created by standard on 3/9/23.
//

import Logging
import SwiftUI
import WebKit
private let log = MakeLogger()

#if os(iOS) || os(watchOS) || os(tvOS)

    struct WebView: UIViewRepresentable {
        @EnvironmentObject
        var tabsViewModel: WebTabsViewModel

        var tab: WebTab

        func makeUIView(context _: Context) -> TTWebView {
            return TTWebView()
        }

        func updateUIView(_ webView: TTWebView, context: Context) {
            updateCoordinatorAndReloadIfNeccessary(webView, coordinator: context.coordinator)
        }
    }

#elseif os(macOS)

    struct WebView: NSViewRepresentable {
        @EnvironmentObject
        var tabsViewModel: WebTabsViewModel

        var tab: WebTab

        func makeNSView(context _: Context) -> TTWebView {
            log.trace("makeNSView(context _: Context)")

            return TTWebView()
        }

        func updateNSView(_ webView: TTWebView, context: Context) {
            updateCoordinatorAndReloadIfNeccessary(webView, coordinator: context.coordinator)
        }
    }

#else

#endif

extension WebView {
    var request: URLRequest {
        tab.urlRequest
    }
}

extension WebView {
    func updateCoordinatorAndReloadIfNeccessary(_ webView: TTWebView, coordinator: WebViewCoordinator) {
        webView.uiDelegate = coordinator
        webView.navigationDelegate = coordinator

        if coordinator.tab != tab {
            coordinator.tab = tab
            DispatchQueue.main.async {
                webView.load(request)
            }
        }
    }
}

extension WebView {
    func makeCoordinator() -> WebViewCoordinator {
        let coordinator = WebViewCoordinator(self)
        coordinator.tabsViewModel = tabsViewModel
        return coordinator
    }
}
