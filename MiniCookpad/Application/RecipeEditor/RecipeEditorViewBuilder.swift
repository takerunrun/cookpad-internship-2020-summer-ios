//
//  RecipeEditorViewBuilder.swift
//  MiniCookpad
//
//  Created by admin on 2020/08/24.
//  Copyright © 2020 kensuke-hoshikawa. All rights reserved.
//

struct RecipeEditorViewBuilder {
    static func build() -> RecipeEditorViewController {
        let viewController = RecipeEditorViewController()
        let interactor = RecipeEditorInteractor(imageDataStore: ImageDataStore(), recipeDataStore: RecipeDataStore())
        let wireframe = RecipeEditorWireframe(viewController: viewController)
        let presenter = RecipeEditorPresenter(view: viewController, interactor: interactor, wireframe: wireframe)
        viewController.inject(presenter: presenter)

        return viewController
    }
}
