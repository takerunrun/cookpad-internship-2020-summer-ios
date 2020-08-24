
protocol RecipeListViewProtocol: AnyObject {
}

protocol RecipeListPresenterProtocol: AnyObject {
}

protocol RecipeListInteractorProtocol: AnyObject {
    func fetchAllRecipes(completion: @escaping ((Result<[RecipeListRecipe], Error>) -> Void))
}

protocol RecipeListWireframeProtocol: AnyObject {
}
