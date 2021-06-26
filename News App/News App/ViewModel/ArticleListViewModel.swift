//
//  ArticleListViewModel.swift
//  News App
//
//  Created by OPSolutions on 6/26/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct ArticleListViewModel {
    let articleList: [ArticleViewModel]
    
    init(_ articles: [ArticleViewModel]) {
        self.articleList = articles
    }
}

extension ArticleListViewModel {
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articleList.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let articleViewModel = self.articleList[index]
        return articleViewModel
    }
    
    func numberOfSectionsInTableView() -> Int {
        return 1
    }
    
    func heightForRow() -> CGFloat {
        return 360
    }
}

struct ArticleViewModel {
    let title: String
    let description: String
    let author: String
    let publishedAt: String
//    let urlToImage: URL
    
    init (_ article: Article) {
        self.title = article.title ?? ""
        self.description = article.description ?? ""
        self.author = article.author ?? ""
        self.publishedAt = article.publishedAt ?? ""
//        self.urlToImage = article.urlToImage ?? ""
    }
}
