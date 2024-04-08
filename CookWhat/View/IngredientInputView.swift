// IngredientInputView.swift
import SwiftUI

struct IngredientInputView: View {
    @ObservedObject var viewModel: IngredientInputViewModel

    var body: some View {
        VStack {
            TextField("Enter ingredient", text: $viewModel.newIngredient, onCommit: viewModel.addIngredient)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            RemovableItemList(items: $viewModel.ingredients)

            PrimaryButton(action: viewModel.fetchRecipes, label: "Find Recipes", isEnabled: .constant(!viewModel.ingredients.isEmpty))
                .padding()
                .disabled(viewModel.ingredients.isEmpty)

            VStack {
                ScrollView {
                    VStack {
                        ForEach(viewModel.recipes, id: \.name) { recipe in
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
