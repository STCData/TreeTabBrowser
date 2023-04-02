//
//  WebTab+Children.swift
//
//
//  Created by standard on 4/2/23.
//

import Foundation

extension WebTab {
    func findParent(for child: WebTab) -> WebTab? {
        var stack = [self]
        while !stack.isEmpty {
            let current = stack.removeLast()
            if let children = current.children {
                if children.contains(child) {
                    return current
                }
            }

            if let children = current.children {
                stack.append(contentsOf: children)
            }
        }
        return nil
    }

    func addChild(_ child: WebTab) {
        var newChildren = children ?? []
        newChildren.append(child)
        children = newChildren
    }

    func updateChild(_ child: WebTab, with newChild: WebTab) {
        if let i = children?.firstIndex(of: child) {
            children?[i] = newChild
        }
    }
}
