//
//  WebTab+CustomStringConvertible.swift
//
//
//  Created by standard on 4/2/23.
//

import Foundation

extension WebTab: CustomStringConvertible {
    var description: String {
        return (title ?? urlRequest.url?.absoluteString) ?? "n/a"
    }
}
