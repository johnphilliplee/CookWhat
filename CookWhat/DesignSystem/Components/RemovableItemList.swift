//
//  RemovableItemList.swift
//  CookWhat
//
//  Created by John Lee on 4/8/24.
//
import SwiftUI

struct RemovableItemList: View {
    @Binding var items: [String]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                HStack {
                    ForEach(items, id: \.self) { item in
                        RemovableItemView(item: item, removeAction: {
                            if let index = items.firstIndex(of: item) {
                                items.remove(at: index)
                            }
                        })
                    }
                }
                .padding(.horizontal)
                .onChange(of: items.last) { newValue in
                    if let newValue = newValue {
                        withAnimation {
                            proxy.scrollTo(newValue, anchor: .trailing)
                        }
                    }
                }
            }
        }
    }
}
