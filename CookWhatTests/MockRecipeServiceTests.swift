import XCTest
@testable import CookWhat

class MockRecipeServiceTests: XCTestCase {
    var recipeService: MockRecipeService!

    override func setUp() {
        super.setUp()
        recipeService = MockRecipeService()
    }

    override func tearDown() {
        recipeService = nil
        super.tearDown()
    }

    func testFetchRecipes() {
        let expectation = self.expectation(description: "Fetch recipes")

        recipeService.fetchRecipes(ingredients: ["Apple", "Banana"]) { recipes in
            XCTAssertFalse(recipes.isEmpty, "No recipes were loaded")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
