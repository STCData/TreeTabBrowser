//
//  DisclosureGroupCompat.swift
//
//
//  Created by standard on 4/2/23.
//

import SwiftUI

struct DisclosureGroupOld<Label, Content>: View where Label: View, Content: View {
    var isExpanded: Binding<Bool>

    @ViewBuilder
    var content: () -> Content

    @ViewBuilder
    var label: () -> Label

    var body: some View {
        VStack {
            label()
            if isExpanded.wrappedValue {
                content()
            }
        }
    }
}

struct DisclosureGroupCompat<Label, Content>: View where Label: View, Content: View {
    var isExpanded: Binding<Bool>

    @ViewBuilder
    var content: () -> Content

    @ViewBuilder
    var label: () -> Label

    var body: some View {
        if #available(iOS 14.0, *) {
            return DisclosureGroup(isExpanded: isExpanded, content: content, label: label)

        } else {
            return DisclosureGroupOld(isExpanded: isExpanded, content: content, label: label)
        }
    }
}
