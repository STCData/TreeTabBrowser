//
//  WebTab+Hashable.swift
//
//
//  Created by standard on 4/2/23.
//

import Foundation

extension WebTab: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: WebTab, rhs: WebTab) -> Bool {
        lhs.id == rhs.id
    }
}
