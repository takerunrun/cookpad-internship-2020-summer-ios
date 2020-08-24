
class RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    private weak var view: RecipeDetailsViewProtocol!
    private let interactor: RecipeDetailsInteractorProtocol
    private let wireframe: RecipeDetailsWireframeProtocol
    private let recipeID: String
    
    init(view: RecipeDetailsViewProtocol, interactor: RecipeDetailsInteractorProtocol, wireframe: RecipeDetailsWireframeProtocol, recipeID: String) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.recipeID = recipeID
    }
    
    func refresh() {
        
    }
    
    func close() {
        
    }
}
