
protocol RecipeDetailsViewProtocol: AnyObject {
}

protocol RecipeDetailsPresenterProtocol: AnyObject {
    func refresh()
    func close()
}

protocol RecipeDetailsInteractorProtocol: AnyObject {
    func fetchRecipe(recipeID: String, completion: @escaping ((Result<RecipeDetailsRecipe, Error>) -> Void))
}

protocol RecipeDetailsWireframeProtocol: AnyObject {
}
