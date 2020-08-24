
class RecipeListPresenter: RecipeListPresenterProtocol {
    private weak var view: RecipeListViewProtocol!
    private let interactor: RecipeListInteractorProtocol
    private let wireframe: RecipeListWireframeProtocol
    
    init(view: RecipeListViewProtocol, interactor: RecipeListInteractorProtocol, wireframe: RecipeListWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}
