//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Laert Xhumari on 3/9/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var TweetContent: UILabel!
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var profileImgView: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
