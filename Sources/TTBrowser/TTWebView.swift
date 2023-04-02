//
//  TTWebView.swift
//  
//
//  Created by standard on 4/2/23.
//

import WebKit

class TTWebView: WKWebView {
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)

        disappear()
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


#if os(iOS) || os(watchOS) || os(tvOS)

import UIKit

extension TTWebView {
    
    @MainActor
    func disappear() {
        self.alpha = 0.01
    }

    @MainActor
    func appearAnimated() {
        UIView.animate(withDuration: 0.02, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: [.curveEaseIn], animations: {
            self.alpha = 1

        }, completion: nil)

    }
}

#else

import AppKit

extension TTWebView {
    
    @MainActor
    func disappear() {
        self.alphaValue = 0.01
    }

    @MainActor
    func appearAnimated() {
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.02
            self.animator().alphaValue = 1
        }, completionHandler: {
            self.isHidden = false
            self.alphaValue = 1
        })


    }
}

#endif
