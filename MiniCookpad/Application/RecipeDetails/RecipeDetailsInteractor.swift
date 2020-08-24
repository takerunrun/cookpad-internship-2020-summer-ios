
class RecipeDetailsInteractor: RecipeDetailsInteractorProtocol {
    private let recipeDataStore: RecipeDataStoreProtocol
    
    init(recipeDataStore: RecipeDataStoreProtocol) {
        self.recipeDataStore = recipeDataStore
    }
}
