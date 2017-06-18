//
//  WeatherTableViewCell.swift
//  FinalProgram
//
//  Created by tom on 2017/6/16.
//  Copyright © 2017年 tom. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var daybegin: UILabel!
    @IBOutlet weak var dayend: UILabel!
    @IBOutlet weak var weatherdescription: UILabel!
    @IBOutlet weak var lowtem: UILabel!
    @IBOutlet weak var hightem: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
