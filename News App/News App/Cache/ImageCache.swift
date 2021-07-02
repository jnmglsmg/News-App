//
//  ImageCache.swift
//  News App
//
//  Created by OPSolutions on 6/30/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

class ImageCache {

    static let shared = ImageCache()
    let cachedImage = NSCache<NSString, UIImage>()
    
    func saveImage(with url: String,_ image: UIImage) {
        let urlString = url as NSString
        self.cachedImage.setObject(image, forKey: urlString)
    }
    
    func getImage(with url: String) -> UIImage? {
        let urlString = url as NSString
        let image = self.cachedImage.object(forKey: urlString)
        
        return image
    }
}
