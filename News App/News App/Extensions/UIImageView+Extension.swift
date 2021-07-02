//
//  UIImageView+Extension.swift
//  News App
//
//  Created by OPSolutions on 6/30/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

class URLImageView: UIImageView {
    
    var imageUrlString: String = ""
    
    func loadImageWithUrl(url: URL?) {
        
        guard let url = url else {
            //set broken image
            return;
        }
        
        imageUrlString = url.absoluteString
        self.image = nil
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.center
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
        
        if let cachedImage = ImageCache.shared.getImage(with: imageUrlString) {
            DispatchQueue.main.async {
                self.image = cachedImage
                activityIndicator.stopAnimating()
                return
            }
        }
        
        NetworkService.shared.fetchItems(with: url) { (data, error) in
            DispatchQueue.main.async {
                activityIndicator.stopAnimating()
                guard let data = data, error == nil else {
                    self.image = UIImage()
                    return
                }
                let fetchedImage = UIImage(data: data)
                
                if self.imageUrlString == url.absoluteString {
                    self.image = fetchedImage
                }

                ImageCache.shared.saveImage(with: self.imageUrlString, fetchedImage!)
            }
        }
    }
}
