//
//  blogTableViewCell.swift
//  FinalProgram
//
//  Created by tom on 2017/6/13.
//  Copyright © 2017年 tom. All rights reserved.
//

import UIKit

class blogTableViewCell: UITableViewCell {

    @IBOutlet weak var bloglocation: UILabel!
    @IBOutlet weak var blogtitle: UILabel!
    @IBOutlet weak var blogimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
