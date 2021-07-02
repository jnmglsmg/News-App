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
    var articleListViewModel: ArticleListViewModel?
    var articleListService: ArticleListService = ArticleListService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        setup()
    }
    
    private func setup() {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.tableView!.center
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        
        articleListService.getArticleList { (articleList, error) in
            DispatchQueue.main.async {
                activityIndicator.stopAnimating()
                
                if let articleList = articleList, error == nil {
                    self.articleListViewModel = articleList
                    self.tableView?.reloadData()
                } else {
                    self.showalertView(title: "Failed", message: error?.localizedDescription ?? "Failed to load article list.")
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articleListViewModel = articleListViewModel else {
            return 0
        }
        return articleListViewModel.numberOfRowsInSection(section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let articleListViewModel = articleListViewModel else {
            return 0
        }
        return articleListViewModel.numberOfSectionsInTableView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let articleListViewModel = articleListViewModel else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListTableViewCellID) as! ArticleListTableViewCell
        let articleViewModel = articleListViewModel.articleAtIndex(indexPath.section)
        
        cell.setCell(title: articleViewModel.title, description: articleViewModel.description, date: articleViewModel.publishedAt, author: articleViewModel.author, imageUrl: articleViewModel.urlToImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        guard let articleListViewModel = articleListViewModel else {
            return 0
        }
        return articleListViewModel.heightForHeader()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func showalertView(title: String, message: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOkayButton = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertViewController.addAction(alertOkayButton)
        
        self.present(alertViewController, animated: true, completion: nil)
    }
}
