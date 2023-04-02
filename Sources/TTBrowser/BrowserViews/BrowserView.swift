//
//  BrowserView.swift
//  DataCollector
//
//  Created by standard on 3/18/23.
//

import SwiftUI

public struct BrowserView: View {
    @ObservedObject var webTabsViewModel: WebTabsViewModel
    @State private var isSideBarOpened = false

    @State var webViewBlurRadius: CGFloat = 0
    @State var webViewPaddingLeading: CGFloat = 0

    public init(webTabsViewModel: WebTabsViewModel) {
        self.webTabsViewModel = webTabsViewModel
    }

    public var body: some View {
        ZStack(alignment: .top) {
            Color(.white)
                .allowsHitTesting(false)
                .edgesIgnoringSafeArea(.all)

            TabbedWebView(webTabsViewModel: webTabsViewModel)
                .blur(radius: webViewBlurRadius)
                .padding(.leading, webViewPaddingLeading)
                .valueChanged(of: isSideBarOpened, perform: { value in
                    if value {
                        withAnimation {
                            webViewBlurRadius = Self.sidebarOpenedBlur
                            webViewPaddingLeading = Self.sidebarOpenedWebviewPaddingLeading
                        }
                    } else {
                        withAnimation {
                            webViewBlurRadius = 0
                            webViewPaddingLeading = 0
                        }
                    }
                })

            // UIScreen.main.bounds.size.width * 0.9
            SlideoutView(
                opacity: 0.8,
                isSidebarVisible: $isSideBarOpened, sideBarWidth: Self.sidebarOpenedWidth,
                bgColor: .gray.opacity(0.89),
                shadowColor: .clear // .black.opacity(0.9)
            ) {
                SidePanelView(isSidebarVisible: $isSideBarOpened)
                    .padding(EdgeInsets(top: 60, leading: 12, bottom: 42, trailing: 12))
            }
            FloatingAtCorner(alignment: .bottomTrailing) {
                FloatingButton(action: {
                    isSideBarOpened.toggle()
                }, icon: "square.on.square", width: 64, height: 64, cornerRadius: 12)
            }

            if #available(iOS 14.0, *) {
                Button(action: {
                    isSideBarOpened.toggle()
                }, label: {})
                    .keyboardShortcut("g", modifiers: .command)
            } else {
                // Fallback on earlier versions
            }
        }
        .environmentObject(webTabsViewModel)
        .padding(.top, 30)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        let webTabsViewModel = WebTabsViewModel(tabs: [
            WebTab(urlRequest: URLRequest(url: WebTab.blankPageURL1)),
            WebTab(urlRequest: URLRequest(url: WebTab.blankPageURL2)),
            WebTab(urlRequest: URLRequest(url: WebTab.blankPageURL3)),
        ])
        BrowserView(webTabsViewModel: webTabsViewModel)
    }
}
