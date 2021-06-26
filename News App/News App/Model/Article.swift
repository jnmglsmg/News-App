//
//  Article.swift
//  News App
//
//  Created by OPSolutions on 6/26/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

struct ArticleList: Decodable {
    let totalResults: Int?
    let articles: [Article]?
}

struct Article: Decodable {
    let title: String?
    let description: String?
    let author: String?
    let urlToImage: URL?
    let content: String?
    let source: Source?
    let publishedAt: String?
}
