//
//  RecipeEditorWireframe.swift
//  MiniCookpad
//
//  Created by admin on 2020/08/24.
//  Copyright © 2020 kensuke-hoshikawa. All rights reserved.
//
import UIKit

class RecipeEditorWireframe: RecipeEditorWireframeProtocol {
    private weak var viewController: UIViewController!
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func close() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
