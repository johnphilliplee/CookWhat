// IngredientInputViewModel.swift
import SwiftUI
import Combine

class IngredientInputViewModel: ObservableObject {
    @Published var ingredients: [String] = []
    @Published var recipes: [Recipe] = []
    @Published var newIngredient: String = ""

    private var recipeService: RecipeService
    private var cancellables = Set<AnyCancellable>()

    init(recipeService: RecipeService) {
        self.recipeService = recipeService
    }

    func addIngredient() {
        ingredients.append(newIngredient)
        newIngredient = ""
    }

    func fetchRecipes() {
        recipeService.fetchRecipes(ingredients: ingredients) { recipes in
            self.recipes = recipes
        }
    }
}
