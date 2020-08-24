
import UIKit

class RecipeListWireframe: RecipeListWireframeProtocol {
    private weak var viewController: UIViewController!
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
