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
