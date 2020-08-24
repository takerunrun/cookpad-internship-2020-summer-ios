//
//  ImageDataStore.swift
//  MiniCookpad
//
//  Created by admin on 2020/08/24.
//  Copyright © 2020 kensuke-hoshikawa. All rights reserved.
//

import FirebaseStorage
import Firebase

protocol ImageDataStoreProtocol {
    func createImage(imageData: Data, completion: @escaping ((Result<ImagePath, Error>) -> Void))
}

struct ImageDataStore: ImageDataStoreProtocol {
    private let storageReference: StorageReference
    
    init(storageReference: StorageReference) {
        self.storageReference = storageReference
    }
    
    func createImage(imageData: Data, completion: @escaping ((Result<ImagePath, Error>) -> Void)) {
        let fileName = "\(UUID()).jpg"
        let imageRef = storageReference.child(fileName)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        _ = imageRef.putData(imageData, metadata: metaData) { metadata, error in
            if let error = error {
                completion(.failure(error))
            } else {
                let imagePath = ImagePath(path: fileName)
                completion(.success(imagePath))
            }
        }
    }
}
