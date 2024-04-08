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

            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { proxy in
                    HStack {
                        ForEach(ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                                .font(.title2)
                                .padding(.horizontal) // horizontal padding
                                .padding(.vertical, 5) // reduced vertical padding
                                .overlay(
                                    Capsule().stroke(Color.gray, lineWidth: 1)
                                )
                                .id(ingredient)
                        }
                    }
                    .padding(.horizontal)
                    .onChange(of: ingredients.last) { newValue in
                        if let newValue = newValue {
                            withAnimation {
                                proxy.scrollTo(newValue, anchor: .trailing)
                            }
                        }
                    }
                }
            }

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
