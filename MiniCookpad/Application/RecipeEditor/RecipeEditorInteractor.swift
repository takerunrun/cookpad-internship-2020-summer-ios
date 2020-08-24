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
    
    private static func validate(title: String?, steps: [String?], imageData: Data?) -> Result<(title: String, steps: [String], imageData: Data), RecipeEditorError> {
        guard let imageData = imageData  else {
            return .failure(.validationError)
        }

        guard let title = title else {
            return .failure(.validationError)
        }

        let steps = steps.compactMap { $0 }
        if steps.isEmpty, title.isEmpty {
            return .failure(.validationError)
        }
        if containsEmoji(text: title) || (steps.map { Self.containsEmoji(text: $0) }).contains(true) {
            return .failure(.validationError)
        }

        return .success((title: title, steps: steps, imageData: imageData))
    }
    
    private static func containsEmoji(text: String) -> Bool {
        let emojis = text.unicodeScalars.filter { $0.properties.isEmoji }
        return !emojis.isEmpty
    }
}
