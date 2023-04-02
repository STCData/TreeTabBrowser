//
//  BrowserView.swift
//  DataCollector
//
//  Created by standard on 3/18/23.
//

import SwiftUI

public struct BrowserView: View {
    @StateObject var webTabsViewModel = WebTabsViewModel(tabs: [
        WebTab(urlRequest: URLRequest(url: WebTab.blankPageURL1)),
        WebTab(urlRequest: URLRequest(url: WebTab.blankPageURL2)),
        WebTab(urlRequest: URLRequest(url: WebTab.blankPageURL3)),
    ])
    @State private var isSideBarOpened = false

    @State
    private var unsafeAreaColor = unsafeAreaColorDefault

    @State var webViewBlurRadius: CGFloat = 0
    @State var webViewPaddingLeading: CGFloat = 0

    private static let unsafeAreaColorDefault = Color.black.opacity(0.96)
    private static let unsafeAreaColorTapped = Color.white

    static var sidebarOpenedWidth: Double {
        #if os(iOS) || os(watchOS) || os(tvOS)
            UIScreen.main.bounds.size.width * 0.99
        #else
            300.0
        #endif
    }

    static var sidebarOpenedWebviewPaddingLeading: Double {
        #if os(iOS) || os(watchOS) || os(tvOS)
            0.0
        #else
            sidebarOpenedWidth
        #endif
    }

    static var sidebarOpenedBlur: Double {
        #if os(iOS) || os(watchOS) || os(tvOS)
            13.0
        #else
            0.0
        #endif
    }

    public init() {}

    public var body: some View {
        ZStack(alignment: .top) {
            if #available(iOS 14.0, *) {
                Color(.white)
                    .colorMultiply(self.unsafeAreaColor)
                    .ignoresSafeArea()
                    .accessibilityIgnoresInvertColors(true)
                    .allowsHitTesting(false)
            } else {
                Color(.white)
                    .colorMultiply(self.unsafeAreaColor)
                    .allowsHitTesting(false)
                    .edgesIgnoringSafeArea(.all)
            }

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
//        .padding(.top, 30)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserView()
    }
}
