//
//  Card.swift
//  CookWhat
//
//  Created by John Lee on 4/8/24.
//

import SwiftUI

struct Card<Content: View>: View {
    var content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            content
        }        
        .background(Color.white)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
    }
}
