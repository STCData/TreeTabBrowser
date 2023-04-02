//
//  DisclosureGroupCompat.swift
//  
//
//  Created by standard on 4/2/23.
//

import SwiftUI

struct DisclosureGroupCompat<Label, Content> : View where Label : View, Content : View {


    var isExpanded: Binding<Bool>
    
    @ViewBuilder
    var content: () -> Content
    
    @ViewBuilder
    var label: () -> Label
   
    var body: some View {
        if #available(iOS 14.0, *) {
            return DisclosureGroup(isExpanded: isExpanded, content: content, label: label)
            
        } else {
            return HStack {
                label()
                if (isExpanded.wrappedValue) {
                    content()
                }
            }
        }
        
    }

}
