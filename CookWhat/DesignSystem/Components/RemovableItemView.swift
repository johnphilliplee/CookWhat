//
//  RemovableItemView.swift
//  CookWhat
//
//  Created by John Lee on 4/8/24.
//

import SwiftUI

struct RemovableItemView: View {
    var item: String
    var removeAction: () -> Void

    var body: some View {
        HStack(spacing: 4) {
            Text(item)
                .font(.title2)
                .id(item)

            Button(action: removeAction) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
            }
        }
        .padding() // move the button closer to the text
        .background(
            Capsule().stroke(Color.gray, lineWidth: 1)
        )
    }
}
