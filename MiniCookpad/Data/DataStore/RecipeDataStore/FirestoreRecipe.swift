//
//  FirestoreRecipe.swift
//  MiniCookpad
//
//  Created by kensuke-hoshikawa on 2020/08/20.
//  Copyright © 2020 kensuke-hoshikawa. All rights reserved.
//

import Foundation

import Foundation
// Firebase を Codable で利用できるライブラリ
import FirebaseFirestoreSwift

struct FirestoreRecipe: Codable, Equatable {
    /// recipes/:id の id
    @DocumentID var id: String?
    var title: String
    var imagePath: String
    var steps: [String]
    var createdAt = Date()
}
