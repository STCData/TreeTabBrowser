//
//  WebTab+Hashable.swift
//
//
//  Created by standard on 4/2/23.
//

import Foundation

extension WebTab: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: WebTab, rhs: WebTab) -> Bool {
        lhs.id == rhs.id
    }
}
