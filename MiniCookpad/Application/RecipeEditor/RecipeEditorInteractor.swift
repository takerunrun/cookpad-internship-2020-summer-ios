//
//  RecipeEditorInteractor.swift
//  MiniCookpad
//
//  Created by admin on 2020/08/24.
//  Copyright © 2020 kensuke-hoshikawa. All rights reserved.
//

import UIKit

class RecipeEditorInteractor: RecipeEditorInteractorProtocol {
    private let imageDataStore: ImageDataStoreProtocol
    private let recipeDataStore: RecipeDataStoreProtocol
    
    init(imageDataStore: ImageDataStoreProtocol, recipeDataStore: RecipeDataStoreProtocol) {
        self.imageDataStore = imageDataStore
        self.recipeDataStore = recipeDataStore
    }
    
    func createRecipe(title: String?, steps: [String?], image: UIImage?, completion: @escaping ((Result<Void, RecipeEditorError>) -> Void)) {
        
    }
    
    private static func containsEmoji(text: String) -> Bool {
        let emojis = text.unicodeScalars.filter { $0.properties.isEmoji }
        return !emojis.isEmpty
    }
}
