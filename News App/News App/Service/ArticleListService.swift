//
//  ArticleListService.swift
//  News App
//
//  Created by OPSolutions on 6/27/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

class ArticleListService: NSObject {
    
    func getArticleList(_ completion: @escaping(_ result: [ArticleViewModel]?, _ error: Error?) -> Void) {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=6919f4d873c7434ba18c811bc4befc32")
        
        NetworkService.shared.fetchItems(with: url!) { (data, error) in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            var articleViewModelList: [ArticleViewModel] = []
            let articleListResult = try? JSONDecoder().decode(ArticleList.self, from: data)
            
            if let articleListResult = articleListResult {
                for article in articleListResult.articles! {
                    let articleViewModel = ArticleViewModel(article)
                    articleViewModelList.append(articleViewModel)
                }
                completion(articleViewModelList, nil)
            }
            completion(nil, nil)
        }
    }

    
}

