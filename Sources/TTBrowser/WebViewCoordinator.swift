//
//  WebViewCoordinator.swift
//  DataCollector
//
//  Created by standard on 3/19/23.
//

import Logging
import SwiftUI
import WebKit
private let log = MakeLogger()

class WebViewCoordinator: NSObject, WKUIDelegate {
    weak var tabsViewModel: WebTabsViewModel?
    
    weak var tab: WebTab?
    
    private var isInitialLoad = true


    var parent: WebView

    init(_ parent: WebView) {
        self.parent = parent
    }

    // Delegate methods go here

    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame _: WKFrameInfo, completionHandler: @escaping () -> Void) {
#if os(iOS) || os(watchOS) || os(tvOS)

        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completionHandler()
        }
        alertController.addAction(okAction)
        DispatchQueue.main.async {
            webView.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
#elseif os(macOS)
#else

#endif


    }
}

extension WebViewCoordinator: WKNavigationDelegate {
    @MainActor func webView(_ webView: WKWebView, didFinish _: WKNavigation!) {
       
        if let ttWebView = webView as? TTWebView {
            ttWebView.appearAnimated()
        }
        
        guard let webTab = tab, 
              let title = webView.title else { return }

        NotificationCenter.default.post(name: .WebViewDetailsLoaded, object: nil, userInfo: [
            WebViewLoadedUserInfoWebTab: webTab,
            WebViewLoadedUserInfoWebTitle: title,
        ])
    }

    func webView(_: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == WKNavigationType.linkActivated && !isInitialLoad {
            let url = navigationAction.request.url
            log.info("🌐 \(url?.absoluteString ?? "n/a")")

            if let tabsViewModel {
                DispatchQueue.main.async {
                    tabsViewModel.openTab(request: navigationAction.request, fromTab: tabsViewModel.currentTab)
                }
            }
            decisionHandler(WKNavigationActionPolicy.cancel)
            return
        }

        isInitialLoad = false
        decisionHandler(WKNavigationActionPolicy.allow)
    }
}
