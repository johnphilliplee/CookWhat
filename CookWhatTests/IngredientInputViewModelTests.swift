import XCTest
@testable import CookWhat

class IngredientInputViewModelTests: XCTestCase {
    var viewModel: IngredientInputViewModel!
    var mockRecipeService: MockRecipeService!

    override func setUp() {
        super.setUp()
        mockRecipeService = MockRecipeService()
        viewModel = IngredientInputViewModel(recipeService: mockRecipeService)
    }

    func testAddIngredient() {
        viewModel.newIngredient = "Test Ingredient"
        viewModel.addIngredient()
        XCTAssertEqual(viewModel.ingredients, ["Test Ingredient"])
        XCTAssertEqual(viewModel.newIngredient, "")
    }

    func testFetchRecipes() {
        let expectation = self.expectation(description: "Fetch Recipes")
        let testRecipes = [Recipe(name: "Test Recipe", ingredients: ["Test Ingredient"])]
        mockRecipeService.testRecipes = testRecipes

        viewModel.fetchRecipes()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.recipes, testRecipes)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2, handler: nil)
    }
}

class MockRecipeService: RecipeService {
    var testRecipes: [Recipe] = []

    func fetchRecipes(ingredients: [String], completion: @escaping ([Recipe]) -> Void) {
        completion(testRecipes)
    }
}
