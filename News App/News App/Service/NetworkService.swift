//
//  NetworkService.swift
//  News App
//
//  Created by OPSolutions on 6/26/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

class NetworkService: NSObject {
    static let shared = NetworkService()
    
    func fetchItems(with url: URL, completion: @escaping(_ result: Data?, _ error: Error?) -> Void) {
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            completion(data, nil)
        }.resume()
    }
}
