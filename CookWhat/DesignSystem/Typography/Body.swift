//
//  Body.swift
//  CookWhat
//
//  Created by John Lee on 4/8/24.
//

import SwiftUI

struct Body: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.secondary)
    }
}
