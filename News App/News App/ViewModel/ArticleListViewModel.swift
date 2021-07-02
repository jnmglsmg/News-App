//
//  ArticleListViewModel.swift
//  News App
//
//  Created by OPSolutions on 6/26/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct ArticleListViewModel: Codable {
    var articleList: [ArticleViewModel]
    
    init() {
        self.articleList = []
    }
    
    init(_ articles: [ArticleViewModel]) {
        self.articleList = articles
    }
}

extension ArticleListViewModel {
    func numberOfRowsInSection(_ section: Int) -> Int {
        return 1
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let articleViewModel = self.articleList[index]
        return articleViewModel
    }
    
    func numberOfSectionsInTableView() -> Int {
        return self.articleList.count
    }
    
    func heightForRow() -> CGFloat {
        return 380
    }
    
    func heightForHeader() -> CGFloat {
        return 10
    }
}

struct ArticleViewModel: Codable {
    let title: String
    let description: String
    let author: String
    var publishedAt: String
    let urlToImage: URL?
    
    init (article: Article) {
        self.title = article.title ?? ""
        self.description = article.description ?? ""
        self.author = article.author ?? ""
        self.publishedAt = ""
        self.urlToImage = article.urlToImage ?? URL(string: "")
        
        convertISODateString(isoDateString: article.publishedAt ?? "")
    }
    
    mutating func convertISODateString(isoDateString: String) {
        let dateFormatter = DateFormatter()
        let dateFormatter2 = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter2.timeZone = NSTimeZone.local
        guard let publishedAtDate = dateFormatter.date(from: isoDateString) else {
            return
        }
        
        dateFormatter2.dateFormat = "MMM d, yyyy h:mm a"
        let finalDate = dateFormatter2.string(from: publishedAtDate)
        self.publishedAt = finalDate
    }
}
