
class RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    private weak var view: RecipeDetailsViewProtocol!
    private let interactor: RecipeDetailsInteractorProtocol
    private let wireframe: RecipeDetailsWireframeProtocol
    
    init(view: RecipeDetailsViewProtocol, interactor: RecipeDetailsInteractorProtocol, wireframe: RecipeDetailsWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}
