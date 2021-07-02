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
    @IBOutlet var articleImageView: URLImageView?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        articleImageView?.image = nil
    }
    
    func setCell(title: String, description: String, date: String, author: String, imageUrl: URL?) {
        articleImageView?.image = nil
        titleLabel?.text = title
        descriptionLabel?.text = description
        dateLabel?.text = date
        authorLabel?.text = author
        articleImageView?.loadImageWithUrl(url: imageUrl)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        formatCells()
    }
    
    func formatCells() {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 0.1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = true
    }
    
    func setupLabels() {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
