//
//  PostsTableViewCell.swift
//  ItMegaStar_test
//
//  Created by Максим Солнцев on 8/27/20.
//  Copyright © 2020 Максим Солнцев. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
