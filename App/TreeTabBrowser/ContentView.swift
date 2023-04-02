//
//  ContentView.swift
//  TreeTabBrowser
//
//  Created by standard on 4/2/23.
//

import SwiftUI
import TTBrowser

struct ContentView: View {
    let webTabsViewModel = WebTabsViewModel(tabs: [
        WebTab(urlRequest: URLRequest(url: URL(string: "https://google.uk")!)),
        WebTab(urlRequest: URLRequest(url: URL(string: "https://wikipedia.org")!)),
    ])
    var body: some View {
        BrowserView(webTabsViewModel: webTabsViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
