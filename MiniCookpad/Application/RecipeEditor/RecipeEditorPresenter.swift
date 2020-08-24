//
//  RecipeEditorPresenter.swift
//  MiniCookpad
//
//  Created by admin on 2020/08/24.
//  Copyright © 2020 kensuke-hoshikawa. All rights reserved.
//
import UIKit

class RecipeEditorPresenter: RecipeEditorPresenterProtocol {
    private weak var view: RecipeEditorViewProtocol!
    private let interactor: RecipeEditorInteractorProtocol
    private let wireframe: RecipeEditorWireframeProtocol
    
    init(view: RecipeEditorViewProtocol, interactor: RecipeEditorInteractorProtocol, wireframe: RecipeEditorWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func createRecipe(title: String?, steps: [String?], image: UIImage?) {
    }
    
    func close() {
    }
}
