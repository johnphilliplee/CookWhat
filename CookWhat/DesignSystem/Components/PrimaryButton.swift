//
//  PrimaryButton.swift
//  CookWhat
//
//  Created by John Lee on 4/8/24.
//

import SwiftUI

struct PrimaryButton: View {
    var action: () -> Void
    var label: String

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}
