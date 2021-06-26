//
//  ArticleListTableViewCell.swift
//  News App
//
//  Created by OPSolutions on 6/26/21.
//  Copyright © 2021 JM Sumague. All rights reserved.
//

import UIKit

let ArticleListTableViewCellID = "ArticleListTableViewCellID"
class ArticleListTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var descriptionLabel: UILabel?
    @IBOutlet var dateLabel: UILabel?
    @IBOutlet var authorLabel: UILabel?
    @IBOutlet var articleImageView: UIImageView?
    
    var articleViewModel: ArticleViewModel! {
        didSet {
            titleLabel?.text = articleViewModel.title
            descriptionLabel?.text = articleViewModel.description
            dateLabel?.text = articleViewModel.publishedAt
            authorLabel?.text = articleViewModel.author
            //image view create extension here
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
