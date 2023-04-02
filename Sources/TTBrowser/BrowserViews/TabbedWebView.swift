//
//  TabbedWebView.swift
//
//
//  Created by standard on 4/2/23.
//

import SwiftUI

struct TabbedWebView: View {
    @ObservedObject

    var webTabsViewModel: WebTabsViewModel

    var body: some View {
        ZStack {
            ForEach(webTabsViewModel.loadedTabs) { tab in
                WebView(tab: tab)
            }
        }
    }
}
