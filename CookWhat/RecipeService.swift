import Foundation

protocol RecipeService {
    func fetchRecipes(ingredients: [String], completion: @escaping ([Recipe]) -> Void)
}

class MockRecipeService: RecipeService, ObservableObject {
    @Published var recipes: [Recipe] = []

    func fetchRecipes(ingredients: [String], completion: @escaping ([Recipe]) -> Void) {
        // Return some mock data after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion([
                Recipe(name: "Pasta", ingredients: ["Pasta", "Tomato", "Garlic"]),
                Recipe(name: "Salad", ingredients: ["Lettuce", "Tomato", "Cucumber"]),
                // Add more mock recipes as needed
            ])
        }
    }
}

struct Recipe {
    let name: String
    let ingredients: [String]
}
