//
//  Title.swift
//  CookWhat
//
//  Created by John Lee on 4/8/24.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.primary)
    }
}
