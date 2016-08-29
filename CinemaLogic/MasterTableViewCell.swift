//
//  MasterTableViewCell.swift
//  CinemaLogic
//
//  Created by Dmitry Tolmachev on 29.08.16.
//  Copyright © 2016 Dmitry Tolmachev. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
