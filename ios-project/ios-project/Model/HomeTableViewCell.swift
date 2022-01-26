//
//  HomeTableViewCell.swift
//  ios-project
//
//  Created by Ayris Gürbulak on 26.01.2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
