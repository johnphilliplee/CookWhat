//
//  CookWhatApp.swift
//  CookWhat
//
//  Created by John Lee on 4/8/24.
//

import SwiftUI

@main
struct CookWhatApp: App {
    var body: some Scene {
        WindowGroup {
            IngredientInputView(recipeService: MockRecipeService())
        }
    }
}
