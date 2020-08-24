//
//  ImageDataStore.swift
//  MiniCookpad
//
//  Created by admin on 2020/08/24.
//  Copyright © 2020 kensuke-hoshikawa. All rights reserved.
//

import Foundation

protocol ImageDataStoreProtocol {
    func createImage(imageData: Data, completion: @escaping ((Result<ImagePath, Error>) -> Void))
}
