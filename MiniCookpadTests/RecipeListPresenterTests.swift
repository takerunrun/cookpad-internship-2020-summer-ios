//
//  RecipeListPresenterTests.swift
//  MiniCookpadTests
//
//  Created by admin on 2020/08/24.
//  Copyright © 2020 kensuke-hoshikawa. All rights reserved.
//

import Foundation
import XCTest
@testable import MiniCookpad

class MockRecipeListViewController: RecipeListViewProtocol {
    var recipes: [RecipeListRecipe]?
    func showRecipes(_ recipes: [RecipeListRecipe]) {
        self.recipes = recipes
    }
    var error: Error?
    func showError(_ error: Error) {
        self.error = error
    }
}

class MockRecipeListInteractor: RecipeListInteractorProtocol {
    var fetchAllRecipesResult: (Result<[RecipeListRecipe], Error>)!
    func fetchAllRecipes(completion: @escaping ((Result<[RecipeListRecipe], Error>) -> Void)) {
        completion(fetchAllRecipesResult)
    }
}

class MockRecipeListWireframe: RecipeListWireframeProtocol {
    func openRecipeDetails(recipeID: String) { }
}

class RecipeListPresenterTests: XCTestCase {
    var view: MockRecipeListViewController!
    var interactor: MockRecipeListInteractor!
    var wireframe: MockRecipeListWireframe!

    // テストのたびに Mock の状態をリセットする
    override func setUp() {
        super.setUp()
        view = MockRecipeListViewController()
        interactor = MockRecipeListInteractor()
        wireframe = MockRecipeListWireframe()
    }

    func testRefreshSucceeded() {
        let recipes = [RecipeListRecipe(id: "1", title: "title", imagePath: "dummy_path", steps: [])]
        interactor.fetchAllRecipesResult = .success(recipes)
        let presenter = RecipeListPresenter(view: view, interactor: interactor, wireframe: wireframe)

        presenter.refresh()
        XCTAssertEqual(view.recipes, recipes)
    }
}
