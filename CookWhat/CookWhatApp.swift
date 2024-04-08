// CookWhatApp.swift
import SwiftUI

@main
struct CookWhatApp: App {
    var body: some Scene {
        WindowGroup {
            IngredientInputView(viewModel: IngredientInputViewModel(recipeService: MockRecipeService()))
        }
    }
}
