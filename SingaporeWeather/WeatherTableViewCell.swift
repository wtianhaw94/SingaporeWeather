//
//  WeatherTableViewCell.swift
//  SingaporeWeather
//
//  Created by Tian Haw on 3/28/18.
//  Copyright © 2018 tianhaw. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var label_date: UILabel!
    @IBOutlet weak var label_temperature: UILabel!
    @IBOutlet weak var label_text: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
