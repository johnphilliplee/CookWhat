import SwiftUI

struct IngredientInputView: View {
    @ObservedObject var recipeService: MockRecipeService
    @State var ingredients: [String] = []
    @State var recipes: [Recipe] = []
    @State var newIngredient: String = ""

    var body: some View {
        VStack {
            TextField("Enter ingredient", text: $newIngredient, onCommit: {
                self.ingredients.append(self.newIngredient)
                self.newIngredient = ""
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            RemovableItemList(items: $ingredients)

            PrimaryButton(action: {
                recipeService.fetchRecipes(ingredients: ingredients) { recipes in
                    self.recipes = recipes
                }
            }, label: "Find Recipes", isEnabled: .constant(!ingredients.isEmpty))
            .padding()
            .disabled(ingredients.isEmpty)

            VStack {
                ScrollView {
                    VStack {
                        ForEach(recipes, id: \.name) { recipe in
                            Card {
                                VStack(alignment: .leading) {
                                    Text(recipe.name)
                                        .font(.headline)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(recipe.ingredients.joined(separator: ", "))
                                        .font(.subheadline)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}
