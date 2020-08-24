
import UIKit

class RecipeDetailsWireframe: RecipeDetailsWireframeProtocol {
    private weak var viewController: UIViewController!
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
