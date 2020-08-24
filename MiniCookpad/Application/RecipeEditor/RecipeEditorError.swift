//
//  RecipeEditorError.swift
//  MiniCookpad
//
//  Created by admin on 2020/08/24.
//  Copyright © 2020 kensuke-hoshikawa. All rights reserved.
//

import Foundation

enum RecipeEditorError: Error {
    case validationError
    case creationError(Error)
}
