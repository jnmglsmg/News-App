//
//  NewsViewController.swift
//  News App
//
//  Created by OPSolutions on 6/26/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView?
    var articleListViewModel: ArticleListViewModel!
    var articleListService: ArticleListService = ArticleListService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        articleListService.getArticleList { (articleList, error) in
            guard let articleList = articleList, error == nil else {
                print("\(error?.localizedDescription ?? "")")
                return
            }
            
            self.articleListViewModel = ArticleListViewModel(articleList)
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListViewModel.numberOfRowsInSection(section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return articleListViewModel == nil ? 0 : articleListViewModel.numberOfSectionsInTableView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListTableViewCellID) as! ArticleListTableViewCell
        cell.articleViewModel = articleListViewModel.articleAtIndex(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return articleListViewModel.heightForRow()
    }
}
